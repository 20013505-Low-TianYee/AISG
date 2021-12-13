//open resumes in document, check if necessary skill is present, read the name and sends a notification email

for n from 0 to 1
    keyboard [win]
    keyboard Document
    click doc.png
    dclick resume_folder.png
    if n==0 
        dclick click_resume_1.png
    if n==1
        dclick click_resume_2.png
    wait 2
    //copy skills
    hover (550,580)
    hover (1320,780)
    read (550,580)-(1320,780) to skills
    //copy name
    hover (630,220)
    hover (750,250)
    read (630,220)-(750,250) to cand_name
    
    if skills contains "Python"
        //copy phone
        hover (635,290)
        hover (740,320)
        read (635,290)-(740,320) to phone
        dump Name,Mobile\r to candidate.csv
        write `csv_row([cand_name,phone])` to candidate.csv
        click mail.png
        type subject.png as Shortlisted for Interview Notification
        type body.png as Dear `cand_name`,[enter]Thanks for your application to Techno. We were impressed by your background and would like to invite you to a group interview at our office to tell you a little more about the position and get to know you better.[enter]Your interview will be on the 14th of December 2021, 3pm.[enter][enter]Looking forward to meeting you,[enter]Low Tian Yee, HR Department
    else
        click mail.png
        type subject.png as Resume Rejection Notification
        type body.png as Dear `cand_name`,[enter]Thank you for taking the time to consider Techno. Our hiring team had reviewed your application and we'd like to inform you that we are not able to hire you for the position as we are looking for someone with more experience in Python.[enter]We encourage you to apply again in the future.[enter]Thank you again for applying to Techno and we wish you all the best in your job search.[enter][enter]Regards,[enter]Low Tian Yee, HR Department
    click send.png



