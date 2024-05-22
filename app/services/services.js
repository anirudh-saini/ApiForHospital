const db = require("../db/db");
const crypto = require("crypto");

const generateUUID = () => {
	return crypto.randomUUID();
};

const getPsychiatristId = () => {
	let num = Math.floor(Math.random() * 4) + 1;

	return "psychiatrist-" + num;
};

const handlePostPatient = (data, res) => {
	const { name, email, phoneNumber, password, address, patientPhoto } = data;
	const id = generateUUID();

	const photoURL = patientPhoto + id;
	// randomly assigning psychiatrist to patient
	let psychiatristId = getPsychiatristId();

	//insert db query
	const query =
		"INSERT INTO patients (id, psychiatrist_id, name, address, email, phone_number, password, photo_url) " +
		"VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	// saving raw password
	db.execute(
		query,
		[
			id,
			psychiatristId,
			name,
			address,
			email,
			phoneNumber,
			password,
			photoURL,
		],
		(err, results) => {
			if (err) {
				console.error("Error inserting user:", err);
				return res.status(500).json({
					error: true,
					message: "Internal server error",
				});
			}
			console.log("User inserted successfully:", results);
			return res.status(201).json({
				error: false,
				message:
					"Successfully added patient. Assigned Psyhitraist with id: " +
					psychiatristId,
			});
		}
	);
};

// return promise
const createPromise = (query) => {
	return new Promise((resolve, reject) => {
		db.query(query, (err, results) => {
			if (err) {
				reject(err);
			} else {
				resolve(results[0]);
			}
		});
	});
};

const handleGetHospital = (hospitalId, res) => {
	const query = `SELECT 
    h.name AS hospital_name,
    COUNT(DISTINCT p.id) AS psychiatrist_count,
    COUNT(pt.id) AS patient_count
FROM 
    hospital h
INNER JOIN 
    psychiatrist p ON h.id = p.hospital_id
INNER JOIN 
    patients pt ON p.id = pt.psychiatrist_id
WHERE 
    h.id = "${hospitalId}"
GROUP BY 
    h.id;`;

	const query2 = `SELECT 
    JSON_ARRAYAGG(JSON_OBJECT('id',
                    p.id,
                    'name',
                    p.name,
                    'patient_count',
                    (SELECT 
                            COUNT(DISTINCT pti.id)
                        FROM
                            patients pti
                        WHERE
                            pti.psychiatrist_id = p.id))) AS psychiatrist_detail
FROM
    psychiatrist p
WHERE
    p.hospital_id = "${hospitalId}"`;

	const hospitalDetails = createPromise(query);
	const psychiatristDetails = createPromise(query2);

	Promise.all([hospitalDetails, psychiatristDetails])
		.then(([hospitalInfo, psychiatristInfo]) => {
			var payload = {
				error: false,
				data: {
					...hospitalInfo,
					...psychiatristInfo,
				},
			};

			return res.status(200).json(payload);
		})
		.catch((error) => {
			console.error(error);
			var payload = {
				error: true,
				message: "Internal server error",
			};

			return res.status(500).json(payload);
		});
};

module.exports = {
	handlePostPatient,
	handleGetHospital,
};
