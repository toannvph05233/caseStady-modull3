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
DELETE FROM room WHERE roomID > 0;
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

insert room(roomID,roomTitle,roomContent,userName,area,tag,createddate,roomstatus,introduce,roomprice) values (8,"Bespoke Colonial House Near Hoan Kiem Lake","Tọa lạc ở thành phố Hà Nội, cách Chợ Đồng Xuân 700 m và Ô Quan Chưởng chưa đầy 1 km, 'Centraltique Downtown - Bespoke Colonial' House Near Hoan Kiem Lake cung cấp chỗ nghỉ với WiFi miễn phí, máy điều hòa, nhà hàng và quán bar.

Căn hộ có sân hiên và sảnh khách chung.<img src='./templates/images/8-1.jpg' alt='' class='img-fluid'>

Các điểm tham quan nổi tiếng gần 'Centraltique Downtown - Bespoke' gồm có Nhà hát múa rối nước Thăng Long, Nhà Thờ Lớn và Hồ Hoàn Kiếm. Sân bay gần nhất là sân bay quốc tế Nội Bài, cách chỗ nghỉ 25 km.

Quận Hoàn Kiếm là lựa chọn tuyệt vời cho du khách thích người dân thân thiện, ngắm người qua lại và ẩm thực.<img src='./templates/images/8-2.jpg' alt='' class='img-fluid'>

Đây là khu vực ở Hà Nội mà khách yêu thích, theo các đánh giá độc lập.

Các cặp đôi đặc biệt thích địa điểm này — họ cho điểm 9,8 cho kỳ nghỉ dành cho 2 người.
","tu","Hà Nội","Hồ bơi , quầy bar","2020-03-12",TRUE,"Tọa lạc ở thành phố Hà Nội, cách Chợ Đồng Xuân 700 m và Ô Quan Chưởng chưa đầy 1 km.",800000);

--4

insert room(roomID,roomTitle,roomContent,userName,area,tag,createddate,roomstatus,introduce,roomprice) values (9,"May Tropical Villas","Tọa lạc tại thành phố Hà Nội, cách xã Yên Bài 3,8 km, May Tropical Villas có nhà hàng và WiFi miễn phí.

Tất cả phòng nghỉ tại đây đều được bố trí khu vực ghế ngồi, truyền hình vệ tinh màn hình phẳng cũng như phòng tắm riêng với máy sấy tóc và vòi sen. Để thêm phần thuận tiện cho du khách, chỗ nghỉ có thể cung cấp khăn tắm và ga trải giường với một khoản phụ phí.<img src='./templates/images/9-1.jpg' alt='' class='img-fluid'>

Khách sạn phục vụ bữa sáng à la carte hàng ngày.

Khách lưu trú tại May Tropical Villas có thể đi xe đạp ở khu vực gần đó hoặc thư giãn trong vườn.

Sân bay gần nhất là sân bay quốc tế Nội Bài, cách chỗ nghỉ 69 km.<img src='./templates/images/9-2.jpg' alt='' class='img-fluid'>

Các cặp đôi đặc biệt thích địa điểm này — họ cho điểm 9,1 cho kỳ nghỉ dành cho 2 người.","tu","Hà Nội","wifi , spa , phục vụ","2020-03-12",true,"Tọa lạc tại thành phố Hà Nội, cách xã Yên Bài 3,8 km, May Tropical Villas có nhà hàng và WiFi miễn phí.",750000);

--5

insert room(roomID,roomTitle,roomContent,userName,area,tag,createddate,roomstatus,introduce,roomprice) values (10,"Indochina Antique Villa","Featuring a restaurant, a bar, a shared lounge and a garden, Ciel Jardin Old Quarter Indochina Antique Villa is located in the Hoan Kiem district of Hanoi, only 1.1 km from Hanoi Temple of Literature. It is set 1.1 km from Thang Long Water Puppet Theater and provides a shared kitchen.

The villa consists of 1 separate bedroom, 1 bathroom and a living room.

The villa offers a children's playground. Both a bicycle rental service and a car rental service are available at Ciel Jardin Old Quarter Indochina Antique Villa, while hiking can be enjoyed nearby.<img src='./templates/images/10-1.jpg' alt='' class='img-fluid'>

Popular points of interest near the accommodation include Dong Xuan Market, Hoan Kiem Lake and Vietnam Fine Arts Museum. The nearest airport is Noi Bai International, 25 km from Ciel Jardin Old Quarter Indochina Antique Villa, and the property offers a paid airport shuttle service.<img src='./templates/images/10-2.jpg' alt='' class='img-fluid'>

Quận Hoàn Kiếm là lựa chọn tuyệt vời cho du khách thích người dân thân thiện, ngắm người qua lại và ẩm thực.

Đây là khu vực ở Hà Nội mà khách yêu thích, theo các đánh giá độc lập.

Ciel Jardin Old Quarter Indochina Antique Villa đã chào đón khách Booking.com từ Ngày 4 Tháng 6 Năm 2019.","dung","Đà Nẵng","Hồ bơi , quầy bar","2020-03-12",true,"The villa consists of 1 separate bedroom, 1 bathroom and a living room.",845000);

--6

insert room(roomID,roomTitle,roomContent,userName,area,tag,createddate,roomstatus,introduce,roomprice) values (11,"THI Boutique Villa","Nằm tại thành phố Đà Nẵng, cách Bãi biển Mỹ Khê trong vòng 500 m, THI Boutique Villa có dịch vụ nhận phòng/trả phòng cấp tốc, phòng nghỉ không gây dị ứng, vườn, WiFi miễn phí và sân hiên. Khách sạn 2 sao này cũng có dịch vụ phòng, bàn đặt tour và bếp chung. Chỗ nghỉ cung cấp dịch vụ lễ tân 24 giờ và dịch vụ thu đổi ngoại tệ cho khách.<img src='./templates/images/11-1.jpg' alt='' class='img-fluid'>

Tất cả phòng nghỉ tại khách sạn đều được bố trí khu vực ghế ngồi, TV màn hình phẳng và tủ lạnh.

THI Boutique Villa phục vụ bữa sáng à la carte hàng ngày.

Du khách nghỉ tại đây có thể tham gia các hoạt động trong và xung quanh thành phố Đà Nẵng, như đi bộ đường dài.<img src='./templates/images/11-2.jpg' alt='' class='img-fluid'>

THI Boutique Villa nằm cách Cầu Sông Hàn 2,1 km và Cầu tàu Tình yêu 2,4 km. Sân bay gần nhất là sân bay quốc tế Đà Nẵng, nằm trong bán kính 6 km từ khách sạn, và chỗ nghỉ cung cấp dịch vụ đưa đón sân bay với một khoản phụ phí.

Các cặp đôi đặc biệt thích địa điểm này — họ cho điểm 9,6 cho kỳ nghỉ dành cho 2 người.","dung","Đà Nẵng","wifi , spa , phục vụ","2020-03-12",true,"Nằm tại thành phố Đà Nẵng, cách Bãi biển Mỹ Khê trong vòng 500 m. ",500000);

















