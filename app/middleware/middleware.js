const multer = require("multer");

const invalidFileType = "Only images are allowed for profile photo.";
const fiveMB = 5 * 1024 * 1024; // 5mb to bytes

const storage = multer.memoryStorage();
const fileFilter = (req, file, cb) => {
	if (file.mimetype.startsWith("image/")) {
		return cb(null, true);
	} else {
		return cb(new Error(invalidFileType), false);
	}
};

const upload = multer({
	storage: storage,
	limits: {
		fileSize: fiveMB,
	},
	fileFilter: fileFilter,
});

const handleFileError = (err, req, res, next) => {
	if (err instanceof multer.MulterError) {
		console.error(err);
		const payload = {
			error: true,
			message: err.message,
		};

		return res.status(400).json(payload);
	}

	if (err.message === invalidFileType) {
		const payload = {
			error: true,
			message: invalidFileType,
		};

		return res.status(400).json(payload);
	}

	if (err) {
		const payload = {
			error: true,
			message: "Internal server error",
		};

		// logging internal server error to identify the cause
		console.error(err);

		return res.status(500).json(payload);
	}

	next();
};

module.exports = {
	upload,
	handleFileError,
};
