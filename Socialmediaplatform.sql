CREATE DATABASE SocialMediaPlatform;
USE SocialMediaPlatform;


CREATE TABLE Users (
    UserID INT IDENTITY PRIMARY KEY ,
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Gender VARCHAR(10),
    JoinDate DATE DEFAULT GETUTCDATE(),
    DOB DATE
);
 
CREATE TABLE Posts (
    PostID INT IDENTITY PRIMARY KEY ,
    UserID INT NOT NULL,
    Content VARCHAR(100) NOT NULL,
    Visibility VARCHAR(10) CHECK (Visibility IN ('Public', 'Private')),
    CreatedAt DATETIME DEFAULT GETUTCDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) 
);


CREATE TABLE Comments (
    CommentID INT IDENTITY PRIMARY KEY ,
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    Content VARCHAR(100) NOT NULL,
    CommentDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) 
);

CREATE TABLE Interactions (
    InteractionID INT IDENTITY PRIMARY KEY ,
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    Type VARCHAR(50) CHECK (Type IN ('Like', 'Share', 'Love', 'Haha', 'Wow', 'Sad', 'Angry')),
    InteractionDate DATETIME DEFAULT GETUTCDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) 
);


INSERT INTO Users (UserName, Email, Gender, DOB) VALUES 
('Ahmed', 'ahmed@example.com', 'Male', '2000-05-15'),
('Sara', 'sara@example.com', 'Female', '1998-09-22');

INSERT INTO Posts (UserID, Content, Visibility) VALUES 
(1, 'This is my first post!', 'Public'),
(2, 'Hello world!', 'Private');

INSERT INTO Comments (UserID, PostID, Content) VALUES 
(2, 1, 'Nice post!'),
(1, 2, 'Welcome to the platform!');

INSERT INTO Interactions (UserID, PostID, Type) VALUES 
(2, 1, 'Like'),
(1, 2, 'Love');

SELECT * FROM Users;
SELECT * FROM Posts;
SELECT * FROM Comments;
SELECT * FROM Interactions;
