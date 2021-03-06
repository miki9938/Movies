USE [master]
GO
/****** Object:  Database [Movies]    Script Date: 2013-11-18 01:09:52 ******/
CREATE DATABASE [Movies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Movies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Movies.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Movies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Movies_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Movies] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movies] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Movies] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Movies] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Movies] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Movies] SET ARITHABORT OFF 
GO
ALTER DATABASE [Movies] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Movies] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Movies] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Movies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Movies] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Movies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Movies] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Movies] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Movies] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Movies] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Movies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Movies] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Movies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Movies] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Movies] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Movies] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Movies] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Movies] SET  MULTI_USER 
GO
ALTER DATABASE [Movies] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Movies] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Movies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Movies] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Movies]
GO
/****** Object:  Table [dbo].[cast]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cast](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[movie_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[role] [int] NOT NULL,
	[character_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_cast] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comment]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[text] [text] NOT NULL,
	[movie_id] [int] NULL,
	[date] [datetime] NOT NULL,
	[person_id] [int] NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comment_answer]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment_answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comment_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[text] [text] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_comment_answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[image]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] NOT NULL,
	[movie_id] [int] NULL,
	[person_id] [int] NULL,
 CONSTRAINT [PK_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[image_relation]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_relation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image_id] [int] NULL,
	[person_id] [int] NULL,
	[movie_id] [int] NULL,
 CONSTRAINT [PK_image_relation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movie]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[release_date] [date] NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_movie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_movie] UNIQUE NONCLUSTERED 
(
	[release_date] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movie_relation]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_relation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[movie_1_id] [int] NOT NULL,
	[movie_2_id] [int] NOT NULL,
 CONSTRAINT [PK_movie_relation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[person]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[description] [text] NULL,
	[birth_date] [date] NULL,
	[birth_place] [nvarchar](50) NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_user] UNIQUE NONCLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users_vote]    Script Date: 2013-11-18 01:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_vote](
	[user_id] [int] NOT NULL,
	[relation_id] [int] NOT NULL,
	[vote] [bit] NOT NULL,
 CONSTRAINT [PK_users_vote] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[relation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_movie_relation]    Script Date: 2013-11-18 01:09:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_movie_relation] ON [dbo].[movie_relation]
(
	[movie_1_id] ASC,
	[movie_2_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cast]  WITH CHECK ADD  CONSTRAINT [FK_cast_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[cast] CHECK CONSTRAINT [FK_cast_movie]
GO
ALTER TABLE [dbo].[cast]  WITH CHECK ADD  CONSTRAINT [FK_cast_person] FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([id])
GO
ALTER TABLE [dbo].[cast] CHECK CONSTRAINT [FK_cast_person]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_movie1] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_movie1]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_person1] FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_person1]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_user]
GO
ALTER TABLE [dbo].[comment_answer]  WITH CHECK ADD  CONSTRAINT [FK_comment_answer_comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[comment] ([id])
GO
ALTER TABLE [dbo].[comment_answer] CHECK CONSTRAINT [FK_comment_answer_comment]
GO
ALTER TABLE [dbo].[comment_answer]  WITH CHECK ADD  CONSTRAINT [FK_comment_answer_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[comment_answer] CHECK CONSTRAINT [FK_comment_answer_user]
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK_image_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_movie]
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK_image_person] FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([id])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_person]
GO
ALTER TABLE [dbo].[image_relation]  WITH CHECK ADD  CONSTRAINT [FK_image_relation_image] FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([id])
GO
ALTER TABLE [dbo].[image_relation] CHECK CONSTRAINT [FK_image_relation_image]
GO
ALTER TABLE [dbo].[image_relation]  WITH CHECK ADD  CONSTRAINT [FK_image_relation_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[image_relation] CHECK CONSTRAINT [FK_image_relation_movie]
GO
ALTER TABLE [dbo].[image_relation]  WITH CHECK ADD  CONSTRAINT [FK_image_relation_person] FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([id])
GO
ALTER TABLE [dbo].[image_relation] CHECK CONSTRAINT [FK_image_relation_person]
GO
ALTER TABLE [dbo].[movie_relation]  WITH CHECK ADD  CONSTRAINT [FK_movie_relation_movie] FOREIGN KEY([movie_1_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[movie_relation] CHECK CONSTRAINT [FK_movie_relation_movie]
GO
ALTER TABLE [dbo].[movie_relation]  WITH CHECK ADD  CONSTRAINT [FK_movie_relation_movie1] FOREIGN KEY([movie_2_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[movie_relation] CHECK CONSTRAINT [FK_movie_relation_movie1]
GO
ALTER TABLE [dbo].[users_vote]  WITH CHECK ADD  CONSTRAINT [FK_users_vote_movie_relation] FOREIGN KEY([relation_id])
REFERENCES [dbo].[movie_relation] ([id])
GO
ALTER TABLE [dbo].[users_vote] CHECK CONSTRAINT [FK_users_vote_movie_relation]
GO
ALTER TABLE [dbo].[users_vote]  WITH CHECK ADD  CONSTRAINT [FK_users_vote_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[users_vote] CHECK CONSTRAINT [FK_users_vote_user]
GO
USE [master]
GO
ALTER DATABASE [Movies] SET  READ_WRITE 
GO
