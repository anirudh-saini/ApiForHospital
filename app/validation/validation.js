const dns = require("dns");
const { promisify } = require("util");

const resolveMx = promisify(dns.resolveMx);

// simple string validation with min length
// for name and address
const validateString = (str, len) => {
	// check if string exits and if exists check if it is of required length
	if (!str || str.length < len) {
		return false;
	}
	return true;
};

// validate email
// first check if email is proper formated
// second check if email domain has valid mx records
const validateEmail = async (email) => {
	const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

	if (!emailRegex.test(email)) {
		return false;
	}

	let domainName = email.split("@")[1];
	try {
		const mxRecords = await resolveMx(domainName);

		if (mxRecords.length < 1) {
			return false;
		}
	} catch (err) {
		// error resolving mx records
		console.log("error");
		console.error(err.message);
		return false;
	}

	return true;
};

// validate password
// length validation min: 8, max: 15
// one upper case, one lowercase and a number
const validatePassword = (password) => {
	const passwordRegex =
		/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$.!%*#?&:^_-]{8,15}$/;
	return passwordRegex.test(password);
};

// validate phone number
// first check for valid country code
// validate the number
const validatePhoneNumber = (number) => {
	const phoneNumberRegex = /^\+\d{1,3}\s?\d{10}$/;
	return phoneNumberRegex.test(number);
};

const validatePatientBody = async (
	name,
	email,
	phoneNumber,
	password,
	address
) => {
	if (!validateString(name, 3)) {
		const payload = {
			error: true,
			message: "Invalid name. Name should be of minimum 3 length",
		};

		return payload;
	}

	if (!validateString(address, 10)) {
		const payload = {
			error: true,
			message: "Invalid address. Address should be of minimum 10 length",
		};

		return payload;
	}

	if (!validatePassword(password)) {
		const payload = {
			error: true,
			message:
				"Invalid password. Password should of length between 8-15 and should contain atleast one uppercase char, lowercase char and digit",
		};

		return payload;
	}

	if (phoneNumber && !validatePhoneNumber(phoneNumber)) {
		const payload = {
			error: true,
			message: "Invalid phone number",
		};

		return payload;
	}

	if (!(await validateEmail(email))) {
		const payload = {
			error: true,
			message: "Invalid email provided",
		};

		return payload;
	}

	return {
		error: false,
		message: "no input error",
	};
};

module.exports = {
	validatePatientBody,
};
