while true
do
	curl --location --request GET 'http://mule-vax-patient.us-w1.cloudhub.io/api/vaccine-status?firstName=Jack&lastName=Sheppard&dob=1992-05-18'
	sleep 3
	curl --location --request GET 'http://mule-vax-patient.us-w1.cloudhub.io/api/vaccine-status?firstName=Aden&lastName=Episcopio&dob=1994-09-11'
	sleep 3
	curl --location --request GET 'http://mule-vax-patient.us-w1.cloudhub.io/api/vaccine-status?firstName=Max&lastName=Mule&dob=1991-04-06'
	sleep 3
done
