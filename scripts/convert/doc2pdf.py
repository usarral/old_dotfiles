from dotenv import load_dotenv
load_dotenv(~/.dotfiles/.env)
API_KEY = os.getenv('ZAMZAR_API_KEY')
#!/bin/sh
$FILE_PATH = $1
$FORMAT = $2
# Send to the service
# curl https://sandbox.zamzar.com/v1/jobs -u API_KEY: -X POST -F "source_file=@$1" -F "target_format=$2"

# Example response
# {"id":32822874,"key":"API_KEY","status":"initialising","sandbox":true,"created_at":"2023-02-01T17:27:48Z","finished_at":null,"source_file":{"id":143848828,"name":"Practica_hoja_sprite_animacion_css3.docx","size":584989},"target_files":[],"target_format":"pdf","credit_cost":2}%  

# Get status
# curl https://sandbox.zamzar.com/v1/jobs/32822874 -u  API_KEY:

# Example response 
# {"id":32822874,"key":"API_KEY","status":"successful","sandbox":true,"created_at":"2023-02-01T17:27:48Z","finished_at":"2023-02-01T17:27:54Z","source_file":{"id":143848828,"name":"Practica_hoja_sprite_animacion_css3.docx","size":584989},"target_files":[{"id":143848837,"name":"Practica_hoja_sprite_animacion_css3.pdf","size":496481}],"target_format":"pdf","credit_cost":2}% 

# Download
# curl https://sandbox.zamzar.com/v1/files/143848837/content -u API_KEY: -L > converted.$2
