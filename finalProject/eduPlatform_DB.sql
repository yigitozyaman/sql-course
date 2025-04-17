CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,                          
    username VARCHAR(50) UNIQUE NOT NULL,                  
    email VARCHAR(100) UNIQUE NOT NULL,                    
    password VARCHAR(255) NOT NULL,                        
    first_name VARCHAR(50) NOT NULL,                      
    last_name VARCHAR(50) NOT NULL,                       
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
	category_id INTEGER,
    course_name VARCHAR(200) NOT NULL,         
    description TEXT,                         
    start_date DATE NOT NULL,                 
    end_date DATE NOT NULL,                   
    instructor VARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE Courses
	ADD CONSTRAINT fk_category
    FOREIGN KEY (category_id)
    REFERENCES Categories(category_id);

CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,      
    member_id INTEGER NOT NULL,                 
    course_id INTEGER NOT NULL,                 
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 

    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Certificates (
    certificate_id SERIAL PRIMARY KEY,           
    certificate_code VARCHAR(100) UNIQUE NOT NULL, 
    issue_date DATE NOT NULL                     
);

CREATE TABLE CertificateAssignments (
    assignment_id SERIAL PRIMARY KEY,           
    member_id INTEGER NOT NULL,                 
    certificate_id INTEGER NOT NULL,            
    assignment_date DATE NOT NULL,              

    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (certificate_id) REFERENCES Certificates(certificate_id)
);

CREATE TABLE BlogPosts (
    blog_id SERIAL PRIMARY KEY,                
    title VARCHAR(255) NOT NULL,                
    content TEXT NOT NULL,                      
    publish_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    member_id INTEGER NOT NULL,                 
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
