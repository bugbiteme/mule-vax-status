# mule-vax-status

## How to test

Once up and running you can test the API with the following calls:

curl --location --request GET 'http://localhost:8081/api/vaccine-status?firstName=Jack&lastName=Sheppard&dob=1992-05-18'

curl --location --request GET 'http://localhost:8081/api/vaccine-status?firstName=Aden&lastName=Episcopio&dob=1994-09-11'

curl --location --request GET 'http://localhost:8081/api/vaccine-status?firstName=Max&lastName=Mule&dob=1991-04-06'

## Expected output

```
❯ curl --location --request GET 'http://localhost:8081/api/vaccine-status?firstName=Jack&lastName=Sheppard&dob=1992-05-18'
{
  "firstName": "Jack",
  "lastName": "Sheppard",
  "dob": "1992-05-18",
  "doses": [
    {
      "provider": "LAX",
      "doa": "3/22/21",
      "lotNumber": "1234",
      "type": "Pfizer"
    },
    {
      "provider": "WALGREENS",
      "doa": "4/19/21",
      "lotNumber": "5678",
      "type": "Pfizer"
    }
  ]
}
```

```
❯ curl --location --request GET 'http://localhost:8081/api/vaccine-status?firstName=Aden&lastName=Episcopio&dob=1994-09-11'
{
  "firstName": "Aden",
  "lastName": "Episcopio",
  "dob": "1994-09-11",
  "doses": [
    {
      "provider": "CVS",
      "doa": "5/25/21",
      "lotNumber": "1234",
      "type": "Johnson & Johnson"
    }
  ]
}
```

```
❯ curl --location --request GET 'http://localhost:8081/api/vaccine-status?firstName=Max&lastName=Mule&dob=1991-04-06'
{
  "firstName": "",
  "lastName": "",
  "dob": "",
  "doses": [

  ]
}
```