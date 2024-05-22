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

[postman collection](https://www.postman.com/anirudhsaini/workspace/flickr/collection/30154899-4f0085c6-a32b-45d9-8d6a-2ecef781e73c?action=share&creator=30154899)
