# covid_app

using Flutter, Firebase, and SQLite (sqflite package)
import some data from https://www.kaggle.com/iamhungundji/covid19-symptoms-checker?select=Raw-Data.csv

The app has four types of users (Patient, Doctor, Healthcare personnel, and Admin).

First three types of users can sign up using (email/password) and once the user sign up we save his data (email/name/joinDateTime/UserType) to realtime database on firebase.

## Patient user 

he have five main features
first one is to add Symptoms from the first day he got covid-19 disease to the 14st day.

second one is the add his chronics diseases or the previews diseases he got.

third is to check the test results added by the doctor whatever it still positive or negative.

Forth is to Edit his Personal informations for his profile (name, home location, Age, phone number Occupation, Blood type, Gender) 
also if he was vaccinated he can add vaccine name, Data of vaccination, and if he got one Dose or two.

last one is to check this current location to his home location and once patient open the app he will be asked to give location permission to save his current location and check if he is home or not.

![Screenshot_2021-07-13-06-57-02-25](https://user-images.githubusercontent.com/49419245/125416307-2ec13fcf-5a10-4e6a-a22f-2c05ad9018df.png)
![Screenshot_2021-07-13-06-47-32-75](https://user-images.githubusercontent.com/49419245/125416263-465d248e-394f-4dce-952d-fb9faab3acc1.png)
![Screenshot_2021-07-13-06-47-57-68](https://user-images.githubusercontent.com/49419245/125416277-439c9e69-b9c4-4040-8b3b-84480cdac94f.png)
![Screenshot_2021-07-13-06-48-16-78](https://user-images.githubusercontent.com/49419245/125416283-df7fb46a-a74c-43c2-8624-dbb4089130da.png)
![Screenshot_2021-07-13-06-48-27-73](https://user-images.githubusercontent.com/49419245/125416289-9ecab63f-ca14-4872-8462-532708fe19f9.png)
![Screenshot_2021-07-13-06-56-46-79](https://user-images.githubusercontent.com/49419245/125416295-b5d7f7be-bb2f-4fe5-96e0-20a071ad69b4.png)

## Doctor user

doctor has three main features

first one is to check Patients list and add a test report for every patient and he can review all the previews reports.

second is reviewing Symptoms analysis, here there are two types of analysis
first type is General Analysis which showing how many patient get the symptom the data here come from cov_db table from SQlite database, doctor can filter samples with gender, Age, and/or Country.
second type is to select a day and show number of patients that have every symptom, the data here comes from the firebase realtime database.

last feature is to add positive or negative test result for a patient.

![Screenshot_2021-07-13-07-04-21-62](https://user-images.githubusercontent.com/49419245/125418967-fe52a6c1-7dbe-4701-a48a-855517bd44cc.png)
![Screenshot_2021-07-13-07-04-36-41](https://user-images.githubusercontent.com/49419245/125418992-752835a9-0f40-4edf-a7ae-35c6318a9549.png)
![Screenshot_2021-07-13-07-04-52-66](https://user-images.githubusercontent.com/49419245/125419005-9a08b17c-b9f2-4f2c-bfce-3202de5b4430.png)
![Screenshot_2021-07-13-07-05-02-83](https://user-images.githubusercontent.com/49419245/125419014-eac356f7-26d1-4262-b16c-d41d29179bed.png)

## Healthcare personnel user

the users who check the patient the quarantine status for the user and if he at home or not.

he can see the current location and the history of the patient's location.

![Screenshot_2021-07-13-07-06-43-31](https://user-images.githubusercontent.com/49419245/125419564-4e0b974b-2953-4dc9-8d3c-8228b3d4ff2b.png)
![Screenshot_2021-07-13-07-07-09-83](https://user-images.githubusercontent.com/49419245/125419611-963fb3dc-bbe3-47eb-a941-06acbc8346a1.png)

## Admin user

the admin can check number of patients in the app, number of male/female patients, number of vaccinated and also number of fully vaccinated patients.

he can show a chart for the number of patients who got every type of vaccine and another chart for the patients ages.
note: Data here from firebase realtime database.

also admin can show the same symptoms analysis feature of the doctor user and addition bar chart for Severity of cases.
but he can also show Symptoms of the day chart which get the data from sqlite database (from symptoms table).

![Screenshot_2021-07-13-07-31-20-34](https://user-images.githubusercontent.com/49419245/125421653-f93c6ec3-7829-4cf0-9c16-615af53ba618.png)
![Screenshot_2021-07-13-07-31-43-17](https://user-images.githubusercontent.com/49419245/125421679-dedb61eb-3b93-41c9-9eab-79197ee92e90.png)
![Screenshot_2021-07-13-07-31-53-61](https://user-images.githubusercontent.com/49419245/125421694-14c0b927-58af-4855-b7f1-90c272781e38.png)

