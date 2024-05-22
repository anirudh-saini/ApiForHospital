## Libraries and framework used

- Express JS.
- dotenv: to access environment variables from .env file.
- multer: to access form/multipart content type for profile photo upload.
- mysql2:  to connect to mysql database.

## API Endpoints:

- POST /patient
  - request body
    name, email, phoneNumber (optional), password, address and patientPhoto
  - sample response
  		{
  			"error": boolean,
  			"message": string
  		}
  
- GET /hospital
	- request body
	hospitalId
	- sample reponse
			{
				"error": boolean,
				"message": string (only if error is present),
				"data": {
					"hospital_name": string,
					"psychiatrist_count": integer,
    				"patient_count": integer,
   		 			"psychiatrist_detail": [
    		  				{
     		 					"id": string,
     		   					"name": string,
      		  					"patient_count": integer
    		  				}
			  			]
			}
 
## Postman collection

[postman collection](https://google.com)
