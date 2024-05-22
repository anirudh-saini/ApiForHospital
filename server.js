// for env variables
require("dotenv").config();
const app = require("./app");

const PORT = process.env.PORT ?? 8080;
app.listen(PORT, (err) => {
	if (err) {
		console.error("Error starting http server: ", err);
		return;
	}

	console.log("Server is running on PORT:", PORT);
});
