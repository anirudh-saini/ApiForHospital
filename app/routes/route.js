const router = require("express").Router();
const multer = require("multer");

const { PostPatient, GetHospital } = require("../controllers/controllers");
const { upload, handleFileError } = require("../middleware/middleware");

router.post(
	"/patient",
	upload.single("patientPhoto"),
	handleFileError,
	PostPatient
);

router.get("/hospital", GetHospital);

module.exports = router;
