const {
	handlePostPatient,
	handleGetHospital,
} = require("../services/services");
const { validatePatientBody } = require("../validation/validation");

const PostPatient = async (req, res) => {
	// handling file error
	const patientPhoto = req.file;
	if (!patientPhoto) {
		const payload = {
			error: true,
			message: "No patient photo found in req body.",
		};

		return res.status(400).json(payload);
	}
	// hanlde upload file to cloud storage and add public link to db;
	const photo =
		"https://cloudstorage.in/photo/" +
		req.file.originalname.replaceAll(" ", "-");

	// handling other parameters in req body
	const { name, email, phoneNumber, password, address } = req.body;

	// handling input validation
	let payload = await validatePatientBody(
		name,
		email,
		phoneNumber,
		password,
		address
	);
	if (payload.error) {
		return res.status(400).json(payload);
	}

	// handle upload to db
	handlePostPatient(
		{
			name,
			email,
			phoneNumber,
			password,
			address,
			patientPhoto: photo,
		},
		res
	);
};

const GetHospital = (req, res) => {
	const { hospitalId } = req.body;

	if (!hospitalId) {
		return res.status(400).json({
			error: true,
			message: "Hospital id not provided",
		});
	}

	handleGetHospital(hospitalId, res);
};

module.exports = {
	PostPatient,
	GetHospital,
};
