USE [VisitorDb]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 9/9/2021 8:41:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[userTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[User_Type] [varchar](200) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[rec_id]  AS ([userTypeID]),
PRIMARY KEY CLUSTERED 
(
	[userTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qryUserType]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qryUserType] as select row_number () over ( order by rec_id) as [RowNumber], rec_id as [RecID], User_Type as [UserType],created_date as [CreatedDate],
	created_time as [CreatedTime] from UserType
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[department_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([department_id]),
	[department_name] [varchar](200) NULL,
	[department_code] [varchar](20) NULL,
	[department_description] [varchar](max) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EMP_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([EMP_ID]),
	[Email] [varchar](500) NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](200) NULL,
	[userTypeID] [bigint] NULL,
	[Created_Date] [datetime] NULL,
	[created_time] [time](7) NULL,
	[Department_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[EMP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_employee]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_employee] as select row_number() over (order by e.rec_id) as RowNumber, d.department_name as [Department], e.rec_id as [RecID], 
	e.[Name] as [EmployeeName], u.User_Type as [UserType], e.Email as [Email], e.Password as [Password], e.Created_Date as [CreatedDate], e.created_time as [CreatedTime] 
	from Employee e
	join UserType u on u.userTypeID=e.userTypeID
	join Department d on d.department_id=e.Department_id
GO
/****** Object:  View [dbo].[qryDepartment]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qryDepartment] as select row_number() over (order by rec_id) as [RowNumber], rec_id as [RecID], department_name as[DepartmentName], department_code as [DepartmentCode],
department_description as [DepartmentDescription], created_date as [CreatedDate], created_time as [CreatedTime]
from Department
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitor](
	[Visitor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_ID] [bigint] NULL,
	[Name] [varchar](500) NULL,
	[Mobile] [varchar](50) NULL,
	[Organization] [varchar](500) NULL,
	[City] [varchar](50) NULL,
	[Address] [varchar](2000) NULL,
	[VisitPurpose] [varchar](5000) NULL,
	[Visit_Date] [date] NULL,
	[In_Time] [varchar](50) NULL,
	[Out_Time] [varchar](50) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
	[rec_id]  AS ([Visitor_ID]),
	[flag_on] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Visitor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qry_visitor]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qry_visitor] as select row_number() over (order by v.rec_id) as RowNumber, v.rec_id as [RecID], d.department_id as [DepartmentID], d.department_name as [Department],
	e.EMP_ID as [EmployeeID],e.Name as [EmployeeName], v.flag_on as [Flag], v.Name as [VisitorName], v.Mobile as [Mobile], v.Organization as [Organisation],
	v.City as [City], v.Address as [Address], v.Visit_Date as [VisitDate], v.VisitPurpose as [VisitPurpose], v.In_Time as [TimeIn],
	v.Out_Time as [TimeOut], v.created_date as [CreatedDate], v.created_time as [CreatedTime]
	 from Visitor v
	join Employee e on e.EMP_ID=v.Emp_ID
	join Department d on d.department_id=e.Department_id
GO
/****** Object:  Table [dbo].[tbl_dict_tables]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dict_tables](
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[key_name] [varchar](200) NULL,
	[panel_id] [varchar](200) NULL,
	[table_name] [varchar](200) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user_log]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_log](
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[log_url] [varchar](250) NULL,
	[log_date] [date] NULL,
	[log_time] [time](7) NULL,
	[log_sql] [varchar](max) NULL,
	[log_desc] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([department_id], [department_name], [department_code], [department_description], [created_date], [created_time]) VALUES (1, N'Engineering', N'ENG', N'Engineering', CAST(N'2021-07-30' AS Date), CAST(N'12:48:18.4700000' AS Time))
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EMP_ID], [Email], [Password], [Name], [userTypeID], [Created_Date], [created_time], [Department_id]) VALUES (1, N'JOHN', N'JOHN', N'JOHN', 1, CAST(N'2021-07-30T12:48:46.487' AS DateTime), CAST(N'12:48:46.4866667' AS Time), 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_dict_tables] ON 

INSERT [dbo].[tbl_dict_tables] ([rec_id], [key_name], [panel_id], [table_name], [created_date], [created_time]) VALUES (1, N'rec_id', N'PnlEmployee', N'Employee', CAST(N'2021-07-13' AS Date), CAST(N'21:02:40.3433333' AS Time))
INSERT [dbo].[tbl_dict_tables] ([rec_id], [key_name], [panel_id], [table_name], [created_date], [created_time]) VALUES (2, N'rec_id', N'PnlVisitor', N'Visitor', CAST(N'2021-07-13' AS Date), CAST(N'21:02:40.3433333' AS Time))
INSERT [dbo].[tbl_dict_tables] ([rec_id], [key_name], [panel_id], [table_name], [created_date], [created_time]) VALUES (3, N'rec_id', N'PnlDepartment', N'Department', CAST(N'2021-07-13' AS Date), CAST(N'21:02:40.3433333' AS Time))
INSERT [dbo].[tbl_dict_tables] ([rec_id], [key_name], [panel_id], [table_name], [created_date], [created_time]) VALUES (4, N'rec_id', N'PnlUserType', N'UserType', CAST(N'2021-07-13' AS Date), CAST(N'21:02:40.3433333' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_dict_tables] OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([userTypeID], [User_Type], [created_date], [created_time]) VALUES (1, N'Administrator', CAST(N'2021-07-30' AS Date), CAST(N'12:47:13.6133333' AS Time))
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_dict_tables] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_dict_tables] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_user_log] ADD  DEFAULT (getdate()) FOR [log_date]
GO
ALTER TABLE [dbo].[tbl_user_log] ADD  DEFAULT (getdate()) FOR [log_time]
GO
ALTER TABLE [dbo].[UserType] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[UserType] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[Visitor] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Visitor] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[Visitor] ADD  DEFAULT ((0)) FOR [flag_on]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [fkDepartment_id] FOREIGN KEY([Department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [fkDepartment_id]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [fkEmpIDs] FOREIGN KEY([userTypeID])
REFERENCES [dbo].[UserType] ([userTypeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [fkEmpIDs]
GO
ALTER TABLE [dbo].[Visitor]  WITH CHECK ADD  CONSTRAINT [fkEmpID] FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employee] ([EMP_ID])
GO
ALTER TABLE [dbo].[Visitor] CHECK CONSTRAINT [fkEmpID]
GO
/****** Object:  StoredProcedure [dbo].[CRUDDepartment]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDDepartment] (@RecID varchar(100), @DepartmentName varchar(100), @DepartmentCode varchar(100), @DepartmentDescription varchar(max), @StatementType varchar(100)='')
as
BEGIN
if @StatementType='INSERT'
BEGIN
insert into Department ( department_name, department_code, department_description) values (@DepartmentName, @DepartmentCode, @DepartmentDescription)
END
if @StatementType='UPDATE'
BEGIN
update Department set  department_name=@DepartmentName, department_code=@DepartmentCode, department_description=@DepartmentDescription where rec_id=@RecID
END
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDEmployee]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CRUDEmployee] (@RecID varchar(200), @Department varchar(200), @Email  varchar(500), @Password varchar(50),@Name varchar(200),@UserTypeID varchar(200),@StatementType varchar(200))
	as
	BEGIN
	IF @StatementType='INSERT'
	insert into Employee(Department_id, [Email],[Password],[Name], [userTypeID]) values (@Department, @Email, @Password,@Name,@UserTypeID)
	IF @StatementType='UPDATE'
	UPDATE  Employee SET [Email]=@Email,[Password]=@Password,[Name]=@Name, [userTypeID]=@UserTypeID where rec_id=@RecID
	END
GO
/****** Object:  StoredProcedure [dbo].[CRUDFlagOnReport]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDFlagOnReport](@RecID varchar(200), @TimeOut time , @FlagOn int, @StatementType varchar(200)) as 
BEGIN 
IF @StatementType='UPDATE'
update Visitor set flag_on=@FlagOn, Out_Time=@TimeOut where rec_id=@RecID
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDUserType]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDUserType](@RecID varchar(200), @UserType varchar(200), @StatementType varchar(200)) as 
	BEGIN
	if @StatementType='INSERT'
	INSERT INTO UserType(User_Type) values (@UserType)
		if @StatementType='UPDATE'
	UPDATE UserType SET User_Type=@UserType WHERE rec_id=@RecID
	END
GO
/****** Object:  StoredProcedure [dbo].[CRUDVisitor]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDVisitor](@RecID varchar(200), @EmployeeID varchar(200), @Name varchar(500), @Mobile varchar(50),
	@Organization varchar(500), @City varchar(50), @Address varchar(2000), @VisitPurpose varchar(5000), @Visit_Date date , @Intime time,
	@OutTime time, @StatementType varchar(200)) as 
	BEGIN
	IF @StatementType='INSERT'
	INSERT INTO Visitor ([Emp_ID],[Name], [Mobile], [Organization], [City], [Address], [VisitPurpose],[Visit_Date], [In_Time], [Out_Time])
	VALUES (@EmployeeID,@Name, @Mobile,@Organization,@City,@Address,@VisitPurpose , @Visit_Date, @Intime,@OutTime  )
	if @StatementType='UPDATE'
	update Visitor set [Emp_ID]=@EmployeeID,[Name]=@Name, [Mobile]=@Mobile, [Organization]=@Organization, [City]=@City,
	[Address]=@Address, [VisitPurpose]=@VisitPurpose,[Visit_Date]=@Visit_Date, [In_Time]=@Intime, [Out_Time]=@OutTime where rec_id=@RecID
	END
GO
/****** Object:  StoredProcedure [dbo].[GetAuditTrail]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAuditTrail](@StartIndex int, @PageSize int , @TotalCount int output) as 
BEGIN
SELECT @TotalCount=count(1) from tbl_user_log;
WITH CTE AS 
(
select top(@StartIndex + @PageSize -1) row_number() over (order by rec_id) as RowNumber, rec_id as [RecID], user_name as [UserName], log_url as [Log Url], log_date as [Log Date], log_time as [Log Time], log_sql as [Log SQL]  from tbl_user_log
)
select * from CTE where RowNumber between @StartIndex  AND (@StartIndex + @PageSize -1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetDepartment]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetDepartment](@StartIndex int, @PageSize int, @TotalCount int output) as 
	BEGIN
	select @TotalCount=  count(1) from qryDepartment;
	WITH CTE AS 
	(
	SELECT TOP (@StartIndex + @PageSize -1)RowNumber, RecID, [DepartmentName] as [Department Name], [DepartmentCode] as [Department Code],
	[DepartmentDescription] as [Department Description],
	[CreatedDate] as [Created Date],
	[CreatedTime] as [Created Time]  from qryDepartment
	)
	select * from CTE where RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
	END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetEmployee](@StartIndex int, @PageSize int, @TotalCount int output) as 
	BEGIN
	select @TotalCount=  count(1) from qry_employee;
	WITH CTE AS 
	(
	SELECT TOP (@StartIndex + @PageSize -1)RowNumber, RecID,[Department] as [Department],  [EmployeeName] as [Employee Name],[UserType] as [User Type], [CreatedDate] as [Created Date],
	[CreatedTime] as [Created Time]  from qry_employee
	)
	select * from CTE where RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
	END
GO
/****** Object:  StoredProcedure [dbo].[GetUserType]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUserType](@StartIndex int, @PageSize int, @TotalCount int output) as 
	BEGIN
	select @TotalCount=  count(1) from qryUserType;
	WITH CTE AS 
	(
	SELECT TOP (@StartIndex + @PageSize -1)RowNumber, RecID, UserType as [User Type],[CreatedDate] as [Created Date],
	[CreatedTime] as [Created Time]  from qryUserType
	)
	select * from CTE where RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
	END
GO
/****** Object:  StoredProcedure [dbo].[GetVisitorByLogin]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetVisitorByLogin](@StartIndex int, @PageSize int, @TotalCount int output) as 
	BEGIN
	select @TotalCount=  count(1) from qry_visitor;
	WITH CTE AS 
	(
	SELECT TOP (@StartIndex + @PageSize -1)RowNumber, RecID,  [Department],  [EmployeeName] as [Employee Name],
	VisitorName as [Visitor Name], Mobile, Organisation, City, Address, VisitPurpose as [Visit Purpose], 
	TimeIn as [Time in]
	
	,VisitDate as [Visit Date], [CreatedDate] as [Created Date],
	[CreatedTime] as [Created Time]  from qry_visitor where Flag=0
	)
	select * from CTE where RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
	END
GO
/****** Object:  StoredProcedure [dbo].[GetVisitorByLogOut]    Script Date: 9/9/2021 8:41:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetVisitorByLogOut](@StartIndex int, @PageSize int, @TotalCount int output) 
	as 
	BEGIN
	select @TotalCount=  count(1) from qry_visitor;
	WITH CTE AS 
	(
	SELECT TOP (@StartIndex + @PageSize -1)RowNumber, RecID,  [Department],  [EmployeeName] as [Employee Name],
	VisitorName as [Visitor Name], Mobile, Organisation, City, Address, VisitPurpose as [Visit Purpose], 
	TimeIn as [Time in], TimeOut as [Time Out] 
	
	,VisitDate as [Visit Date], [CreatedDate] as [Created Date],
	[CreatedTime] as [Created Time]  from qry_visitor where Flag=1
	)
	select * from CTE where RowNumber between @StartIndex AND (@StartIndex  + @PageSize -1)
	END
GO
