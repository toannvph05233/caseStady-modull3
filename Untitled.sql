create database casestudymodule3;
drop database casestudymodule3;
use casestudymodule3;

create table user(
userName varchar(20) not null unique,
password varchar(20) not null,
firstname varchar(100) not null,
lastname varchar(100) not null,
avatar varchar(100) default "",
birthday date default "1900-01-01",
email varchar(50)  default "",
phonenumber int  default 0,
primary key(username));

create table area(
area varchar(50) not null,
primary key(area));

create table room(
roomID int(20) auto_increment,
roomTitle varchar(300) not null,
roomContent varchar(5000) not null,
userName varchar(20) not null,
area varchar(50) not null,
tag varchar(50),
createddate date not null,
roomstatus bit default false,
introduce varchar(500) not null,
roomprice float not null,
primary key(roomID),
foreign key(userName) references user(userName),
foreign key(area) references area(area));

create table image(
roomimage varchar(300) not null,
roomID int(20) not null,
primary key(roomimage),
foreign key(roomID) references room(roomID));

create table invoice(
invoiceID int(20) not null auto_increment,
userName varchar(20) not null,
invoiceCreatedDate date not null,
primary key(invoiceID),
foreign key(userName) references user(userName));

create table detailinvoice(
invoiceID int(20) not null,
roomID int(20) not null,
roomprice float not null,
rentStartDate date not null,
rentEndDate date not null,
primary key(invoiceID,roomID),
foreign key(roomID) references room(roomID),
foreign key(invoiceID) references invoice(invoiceID));

create table comment(
commentID int(20) auto_increment,
commentContent varchar(500) not null,
commentDate date not null,
roomID int(20) not null,
userName varchar(20) not null,
rating int not null,
primary key(commentID),
foreign key(roomID) references room(roomID),
foreign key(userName) references user(userName));

insert user(userName,password,firstname,lastname) values ("dung",1234,"dung","tran");
insert user(userName,password,firstname,lastname) values ("toan",1234,"toan","nguyen");
insert user(userName,password,firstname,lastname) values ("tu",1234,"tu","dinh");
insert user(userName,password,firstname,lastname) values ("tu1",1234,"tu","dinh");
insert area values ("Hà Nội"),("Đà Nẵng");
insert room(roomID,roomTitle,roomContent,userName,area,tag,createddate,roomstatus,introduce,roomprice) values (5,"RedDoorz Hostel @ Hang Chieu Street
","Hanoi Paraiso Hostel & Travel cách Ô Quan Chưởng 100 m và Chợ Đồng Xuân 200 m. Sân bay gần nhất là sân bay quốc tế Nội Bài, cách đó 20 km. Dịch vụ đưa đón sân bay được cung cấp với một khoản phụ phí.<img src='./templates/images/5-1.jpg' alt='' class='img-fluid'>

Một số phòng có khu vực tiếp khách để tạo thuận tiện cho khách. Các phòng đi kèm phòng tắm riêng.

Quầy lễ tân 24 giờ cung cấp dịch vụ để hành lý.

Quận Hoàn Kiếm là lựa chọn tuyệt vời cho du khách thích người dân thân thiện, ngắm người qua lại và ẩm thực.<img src='./templates/images/5-2.jpg' alt='' class='img-fluid'>

Đây là khu vực ở Hà Nội mà khách yêu thích, theo các đánh giá độc lập.

Các cặp đôi đặc biệt thích địa điểm này — họ cho điểm 9,1 cho kỳ nghỉ dành cho 2 người.

Chúng tôi sử dụng ngôn ngữ của bạn!
","tu","Hà Nội","wifi , spa , phục vụ","2020-03-12",TRUE,"Hanoi Paraiso Hostel & Travel cung cấp các chỗ ở giữa sự nhộn nhịp và hối hả của thành phố Hà Nội.
",9000);

insert room(roomID,roomTitle,roomContent,userName,area,tag,createddate,roomstatus,introduce,roomprice) values (7,"PentStudio West Lake Hanoi","Khách nghỉ tại PentStudio West Lake Hanoi có thể thưởng thức bữa sáng à la carte.

Chỗ nghỉ có hồ bơi trong nhà.<img src='./templates/images/7-1.jpg' alt='' class='img-fluid'>

PentStudio West Lake Hanoi cung cấp dịch vụ cho thuê xe hơi.

PentStudio West Lake Hanoi cách Đền Quán Thánh 5 km, Bảo tàng Dân tộc học Việt Nam 6 km và sân bay gần nhất là sân bay quốc tế Nội Bài 23 km.

Quận Tây Hồ là lựa chọn tuyệt vời cho du khách thích ngắm cảnh, lịch sử và văn hóa.<img src='./templates/images/7-2.jpg' alt='' class='img-fluid'>","tu","Hà Nội","Hồ bơi , quầy bar","2020-03-12",TRUE,"Nằm cách Hồ Tây 5 km, PentStudio West Lake Hanoi cung cấp chỗ nghỉ với nhà hàng.",995600);



















