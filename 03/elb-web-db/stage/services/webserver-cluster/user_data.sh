#!/bin/bash

dnf install -y httpd
cat <<EOF > /var/www/html/index.html
<h1>db IP: ${dbaddress}</h1>
<h1>db_Port: ${dbport}</h1>
<h1>db Name: ${dbname}</h1>
EOF
systemctl enable --now httpd
