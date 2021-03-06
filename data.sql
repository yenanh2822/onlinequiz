USE [master]
GO
CREATE DATABASE [QuizOnl]
GO
ALTER DATABASE [QuizOnl] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizOnl].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizOnl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizOnl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizOnl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizOnl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizOnl] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizOnl] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizOnl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizOnl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizOnl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizOnl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizOnl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizOnl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizOnl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizOnl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizOnl] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizOnl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizOnl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizOnl] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizOnl] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizOnl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizOnl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizOnl] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizOnl] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizOnl] SET  MULTI_USER 
GO
ALTER DATABASE [QuizOnl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizOnl] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizOnl] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizOnl] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizOnl] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuizOnl', N'ON'
GO
ALTER DATABASE [QuizOnl] SET QUERY_STORE = OFF
GO
USE [QuizOnl]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[IdQuestion] [nvarchar](50) NOT NULL,
	[Question] [nvarchar](500) NULL,
	[Answer1] [nvarchar](500) NULL,
	[Answer2] [nvarchar](500) NULL,
	[Answer3] [nvarchar](500) NULL,
	[Answer4] [nvarchar](500) NULL,
	[CorrectAnswer] [nvarchar](500) NOT NULL,
	[IdSubject] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[QuesStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[IdQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizDetail](
	[Email] [nvarchar](50) NOT NULL,
	[Score] [float] NULL,
	[IdQuiz] [int] IDENTITY(1,1) NOT NULL,
	[DoingDate] [datetime] NULL,
	[IdSubject] [nvarchar](50) NULL,
	[FinishTime] [datetime] NULL,
 CONSTRAINT [PK_QuizDetail_1] PRIMARY KEY CLUSTERED 
(
	[IdQuiz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizUser](
	[Email] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](500) NULL,
	[Status] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.QuizUser] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[IdSubject] [nvarchar](50) NOT NULL,
	[NameSubject] [nvarchar](50) NULL,
	[SubStatus] [bit] NULL,
	[NumQuestion] [int] NULL,
	[Time] [time](7) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[IdSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG1', N'______? -There are one thousand.', N'How many grams are there in a kilogram?', N'How many are there grams in a kilogram?', N'How many grams are they in a kilogram?', N'How many grams are there of a kilogram?', N'How many grams are there in a kilogram?', N'ENG', CAST(N'2020-05-26T14:20:01.277' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG10', N'How long ______ in Spain on vacation last summer?', N'were they', N'you are been', N'are been', N'was', N'were they', N'ENG', CAST(N'2020-05-26T14:20:01.290' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG11', N'Next weekend, we hope to ______ for a few days.', N'get away', N'get on', N'get through', N'get of', N'get away', N'ENG', CAST(N'2020-05-26T14:20:01.290' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG12', N'They''re tired ______ they worked for ten hours.', N'because', N'however', N'or', N'when', N'because', N'ENG', CAST(N'2020-05-26T14:20:01.293' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG13', N'______ they the first customers of the day?', N'Were', N'Who', N'Was', N'Who were', N'Were', N'ENG', CAST(N'2020-05-26T14:20:01.293' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG14', N'I must go home because my husband ______ for me.', N'is waiting', N'are waiting', N'am waiting', N'waits', N'is waiting', N'ENG', CAST(N'2020-05-26T14:20:01.293' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG15', N'You can''t have your cake ______ eat it too.', N'and', N'although', N'while', N'or', N'and', N'ENG', CAST(N'2020-05-26T14:20:01.293' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG16', N'Who is your daughter''s brother? -______', N'He is my son.', N'He is married to her.', N'He is her husband''s brother.', N'She is his sister.', N'He is my son.', N'ENG', CAST(N'2020-05-26T14:20:01.297' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG17', N'Had they ______ arrived when you got there?', N'already', N'after', N'before', N'still', N'already', N'ENG', CAST(N'2020-05-26T14:20:01.297' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG18', N'Elizabeth''s been working there ______ only eight months.', N'for', N'in', N'by', N'since', N'for', N'ENG', CAST(N'2020-05-26T14:20:01.297' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG19', N'Who is she talking to on the phone? -______', N'She''s talking to her sister.', N'She talks to Lorenzo Rodriguez', N'Him she is talking to.', N'She''s not talking to me sister.', N'She''s talking to her sister.', N'ENG', CAST(N'2020-05-26T14:20:01.297' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG2', N'Is there a doctor in the house? -______', N'Yes, there is.', N'Yes, is there.', N'No, isn''t.', N'No, they isn''t.', N'Yes, there is.', N'ENG', CAST(N'2020-05-26T14:20:01.297' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG20', N'Thomas can''t get out of bed because he ______ his leg.', N'broke', N'broken', N'break', N'breaks', N'broke', N'ENG', CAST(N'2020-05-26T14:20:01.297' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG21', N'Are these cats bigger than those dogs? -______', N'Yes, they are bigger!', N'Yes, are.', N'No, those dogs are the bigger.', N'No, dogs are the biggest.', N'Yes, they are bigger!', N'ENG', CAST(N'2020-05-26T14:20:01.300' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG22', N'______? -She was at school.', N'Where was Suzanne during the earthquake?', N'Was Suzanne yesterday at home?', N'Suzanne where was yesterday?', N'Where was the sister of Veronica last Friday?', N'Where was Suzanne during the earthquake?', N'ENG', CAST(N'2020-05-26T14:20:01.300' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG222', N'I ___ you', N'miss', N'love', N'like', N'want', N'miss', N'ENG', CAST(N'2020-06-01T23:37:59.083' AS DateTime), N'0')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG23', N'we are so late because our car ______ down on the highway.', N'broke', N'breaks', N'broken', N'break', N'broke', N'ENG', CAST(N'2020-05-26T14:20:01.300' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG24', N'I have never ______ such a boring book!', N'read', N'saw', N'readed', N'red', N'read', N'ENG', CAST(N'2020-05-26T14:20:01.300' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG25', N'Who is your mother''s sister''s daughter? -______', N'She is my cousin.', N'She is my wife.', N'She is my mother''s nephew.', N'Is my mother''s niece.', N'She is my cousin.', N'ENG', CAST(N'2020-05-26T14:20:01.300' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG256', N'... are you from?', N'How', N'Where', N'Which', N'When', N'Where', N'ENG', CAST(N'2020-05-30T13:35:48.890' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG26', N'She ______ blue velvet to the party last night.', N'wore', N'worn', N'weared', N'wear', N'wore', N'ENG', CAST(N'2020-05-26T14:20:01.303' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG27', N'The little dog ______ my leg.', N'bit', N'bited', N'bite', N'bitten', N'bit', N'ENG', CAST(N'2020-05-26T14:20:01.303' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG28', N'You two are always fighting. Why can''t you ______?', N'get along', N'get over', N'get off', N'get down', N'get along', N'ENG', CAST(N'2020-05-26T14:20:01.303' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG29', N'We must ______ the train at the next stop.', N'get off', N'get over', N'get on', N'get down', N'get off', N'ENG', CAST(N'2020-05-26T14:20:01.303' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG3', N'What hours ______? -From nine to five, Monday through Friday.', N'do you normally work', N'work you normally', N'are you normally working', N'you work normally', N'do you normally work', N'ENG', CAST(N'2020-05-26T14:20:01.307' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG30', N'Which river is bigger: the Amazon or the Nile? -______', N'The Amazon''s bigger than the Nile.', N'The Amazon is the bigger.', N'Bigger the Amazon is.', N'The Amazon is bigger the Nile.', N'The Amazon''s bigger than the Nile.', N'ENG', CAST(N'2020-05-26T14:20:01.307' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG31', N'The milk is ______ the refrigerator.', N'in', N'from', N'of', N'at', N'in', N'ENG', CAST(N'2020-05-26T14:20:01.307' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG32', N'______ is your house? -It''s the small grey one.', N'Which', N'When', N'What', N'Where', N'Which', N'ENG', CAST(N'2020-05-26T14:20:01.307' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG33', N'How tall is that building? -______', N'It''s about 95 stories.', N'Is 378 meters tall.', N'That building is much tall than this one.', N'It is tall 300 meters.', N'It''s about 95 stories.', N'ENG', CAST(N'2020-05-26T14:20:01.310' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG34', N'The train goes ______ many tunnels on the way to Rome.', N'through', N'in', N'past', N'over', N'through', N'ENG', CAST(N'2020-05-26T14:20:01.310' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG35', N'Whose keys are these? -______ are mine.', N'They', N'These', N'It', N'Keys', N'They', N'ENG', CAST(N'2020-05-26T14:20:01.310' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG36', N'We''ve just come ______ the beach and we are thirsty.', N'from', N'for', N'back', N'of', N'from', N'ENG', CAST(N'2020-05-26T14:20:01.310' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG37', N'I can speak English, but I ______ French.', N'can''t speak', N'speak', N'speak not', N'no speak', N'can''t speak', N'ENG', CAST(N'2020-05-26T14:20:01.310' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG38', N'What is she doing? -______', N'She''s waiting for you.', N'She cooking dinner.', N'She are watching TV.', N'She''d talking to Mary on the phone.', N'She''s waiting for you.', N'ENG', CAST(N'2020-05-26T14:20:01.313' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG39', N'Where should Suzanne ______?', N'sit', N'find', N'put', N'repair', N'sit', N'ENG', CAST(N'2020-05-26T14:20:01.313' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG4', N'My hair is longer than ______.', N'hers', N'your', N'your''s', N'she''s', N'hers', N'ENG', CAST(N'2020-05-26T14:20:01.313' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG40', N'Never look directly ______ the sun. It is bad for your eyes.', N'at', N'to', N'for', N'through', N'at', N'ENG', CAST(N'2020-05-26T14:20:01.313' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG41', N'She ______ dinner with Junko when you called last night.', N'was having', N'am having', N'have', N'had had', N'was having', N'ENG', CAST(N'2020-05-26T14:20:01.313' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG42', N'______ tired from working so much?', N'Are you', N'She''s', N'Is', N'You are', N'Are you', N'ENG', CAST(N'2020-05-26T14:20:01.313' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG43', N'Right now, my mother ______ dinner in the kitchen.', N'cooking', N'cooks', N'does cook', N'is cooking', N'is cooking', N'ENG', CAST(N'2020-05-26T14:20:01.317' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG44', N'I''m surprised because rain was not ______ in the weather report.', N'predicted', N'prediction', N'predictable', N'predictably', N'predicted', N'ENG', CAST(N'2020-05-26T14:20:01.317' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG45', N'I told you ______ you didn''t listen.', N'but', N'because', N'for', N'then', N'but', N'ENG', CAST(N'2020-05-26T14:20:01.317' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG46', N'English grammar ______ than German grammar.', N'is worse.', N'is worst.', N'worst.', N'is badder.', N'is worse.', N'ENG', CAST(N'2020-05-26T14:20:01.317' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG47', N'I''m busy, so you will just have to ______.', N'wait', N'avoid', N'like', N'attempt', N'wait', N'ENG', CAST(N'2020-05-26T14:20:01.317' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG48', N'______ are you mad? -Because you are late!', N'Why', N'When', N'Where', N'What', N'Why', N'ENG', CAST(N'2020-05-26T14:20:01.317' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG49', N'These pants ______ mine; that jacket is yours.', N'are', N'is', N'are wearing', N'is wearing', N'are', N'ENG', CAST(N'2020-05-26T14:20:01.317' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG499', N'What What', N'A', N'B', N'Is', N'D', N'A', N'ENG', CAST(N'2020-05-29T11:12:58.517' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG5', N'He was invited ______ he did not come.', N'but', N'if', N'when', N'or', N'but', N'ENG', CAST(N'2020-05-26T14:20:01.317' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG50', N'We get good grades ______ we study.', N'because', N'but', N'except', N'or', N'because', N'ENG', CAST(N'2020-05-26T14:20:01.317' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG500', N'What What', N'A', N'B', N'C', N'D', N'A', N'ENG', CAST(N'2020-05-29T11:32:57.370' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG51', N'I''m sleepy because I ______ at six o''clock this morning.', N'got up', N'got by', N'got down', N'got along', N'got up', N'ENG', CAST(N'2020-05-26T14:20:01.320' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG52', N'Edward has always ______ things very quickly and efficiently.', N'done', N'does', N'doed', N'did', N'done', N'ENG', CAST(N'2020-05-26T14:20:01.320' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG53', N'I''ve ______ a terrible headache.', N'got', N'have', N'gets', N'gottin', N'got', N'ENG', CAST(N'2020-05-26T14:20:01.320' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG54', N'What ______? -This is my new ring.', N'is that', N'is', N'are these', N'those', N'is that', N'ENG', CAST(N'2020-05-26T14:20:01.323' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG55', N'I will speak ______ Suzanne when I see her.', N'to', N'in', N'around', N'at', N'to', N'ENG', CAST(N'2020-05-26T14:20:01.323' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG56', N'______ my wife sleeps, I watch TV late at night.', N'While', N'Through', N'During', N'From', N'While', N'ENG', CAST(N'2020-05-26T14:20:01.323' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG57', N'He ______ all of them.', N'wanted', N'went', N'listened', N'spoke', N'wanted', N'ENG', CAST(N'2020-05-26T14:20:01.327' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG58', N'She cannot talk ______ walk at the same time.', N'and', N'because', N'while', N'but', N'and', N'ENG', CAST(N'2020-05-26T14:20:01.327' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG59', N'What ______ your favorite foods as a child?', N'were', N'will', N'would', N'was', N'were', N'ENG', CAST(N'2020-05-26T14:20:01.327' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG6', N'Where are my car keys? -They are ______ your hand!', N'in', N'on', N'to', N'of', N'in', N'ENG', CAST(N'2020-05-26T14:20:01.327' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG60', N'Monica is tired. She doesn''t want to go ______ school.', N'to', N'at', N'for', N'in', N'to', N'ENG', CAST(N'2020-05-26T14:20:01.327' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG61', N'_____ is your mother''s sister feeling today?', N'How', N'What', N'Why', N'Which', N'How', N'ENG', CAST(N'2020-05-26T14:20:01.330' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG62', N'_____ is your mother''s sister''s son feeling today?', N'Which', N'What', N'Why', N'How', N'How', N'ENG', CAST(N'2020-05-26T14:20:01.330' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG63', N'a', N'a', N'a', N'a', N'a', N'a', N'ENG', CAST(N'2020-05-26T14:20:01.330' AS DateTime), N'0')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG64', N'a', N'a', N'a', N'a', N'a', N'a', N'ENG', CAST(N'2020-05-26T14:20:01.330' AS DateTime), N'0')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG65', N'a', N'a', N'a', N'a', N'a', N'a', N'ENG', CAST(N'2020-05-26T14:20:01.330' AS DateTime), N'0')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG7', N'Whiskey gets better and better as it ______.', N'ages', N'age', N'ageing', N'aged', N'ages', N'ENG', CAST(N'2020-05-26T14:20:01.333' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG8', N'Pamela ______ a big lunch and now she''s sleepy.', N'ate', N'eats', N'eaten', N'eating', N'ate', N'ENG', CAST(N'2020-05-26T14:20:01.333' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'ENG9', N'I have never ______ such a boring book!', N'read', N'saw', N'readed', N'red', N'read', N'ENG', CAST(N'2020-05-26T14:20:01.333' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ3111', N'Swing components that don''t rely on native GUI are referred to as ___________.', N'lightweight components', N'heavyweight components', N'GUI components', N'non-GUI components', N'lightweight components', N'PRJ311', CAST(N'2020-05-26T14:25:30.477' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31110', N'What is best to describe the relationship between Component and Color?', N'Association', N'Aggregation', N'Composition', N'Inheritance', N'Association', N'PRJ311', CAST(N'2020-05-26T14:25:30.493' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31111', N'Which of the following classes are in the java.awt package?', N'Color', N'None of the others', N'JComponent', N'JFrame', N'Color', N'PRJ311', CAST(N'2020-05-26T14:25:30.493' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31112', N'Which of the following statements is for placing the frame''s upper left corner to (200, 100)?', N'frame.setLocation(200, 100)', N'frame.setLocation(100, 100)', N'frame.setLocation(100, 200)', N'frame.setLocation(200, 200)', N'frame.setLocation(200, 100)', N'PRJ311', CAST(N'2020-05-26T14:25:30.497' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ311120', N'What is best to describe the relationship between JComponent and JButton?', N'Association', N'Aggregation', N'Composition', N'Inheritance', N'Inheritance', N'PRJ311', CAST(N'2020-05-29T19:52:38.957' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31113', N'What layout manager should you use so that every component occupies the same size in the container?', N'a GridLayout', N'a FlowLayout', N'a BorderLayout', N'any layout', N'a GridLayout', N'PRJ311', CAST(N'2020-05-26T14:25:30.497' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31114', N'__________ should be used to position a Button so that the size of the Button is NOT affected by the Frame size.', N'a FlowLayout', N'a GridLayout', N'the center area of a BorderLayout', N'the East or West area of a BorderLayout', N'a FlowLayout', N'PRJ311', CAST(N'2020-05-26T14:25:30.497' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31115', N'Suppose a JFrame uses the GridLayout(2, 2). If you add six buttons to the frame, how many columns are displayed?', N'3', N'1', N'2', N'4', N'3', N'PRJ311', CAST(N'2020-05-26T14:25:30.497' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31116', N'Suppose a JFrame uses the GridLayout(0, 2). If you add six buttons to the frame, how many columns are displayed?', N'2', N'1', N'3', N'4', N'2', N'PRJ311', CAST(N'2020-05-26T14:25:30.497' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31117', N'The default layout out of a contentPane in a JFrame is __________.', N'BorderLayout', N'FlowLayout', N'GridLayout', N'None', N'BorderLayout', N'PRJ311', CAST(N'2020-05-26T14:25:30.497' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31118', N'The default layout out of a JPanel is __________.', N'FlowLayout', N'GridLayout', N'BorderLayout', N'None', N'FlowLayout', N'PRJ311', CAST(N'2020-05-26T14:25:30.497' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31119', N'To create a JPanel of the BorderLayout, use ______________.', N'JPanel p = new JPanel(new BorderLayout());', N'JPanel p = new JPanel();', N'JPanel p = new JPanel(BorderLayout());', N'JPanel p = new JPanel().setLayout(new BorderLayout());', N'JPanel p = new JPanel(new BorderLayout());', N'PRJ311', CAST(N'2020-05-26T14:25:30.497' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ3112', N'__________ are referred to as heavyweight components.', N'AWT components', N'Swing components', N'GUI components', N'Non-GUI components', N'AWT components', N'PRJ311', CAST(N'2020-05-26T14:25:30.500' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31120', N'To add a component c to a JPanel p, use _________.', N'p.add(c)', N'p.getContentPane(c)', N'p.insert(c)', N'p.append(c)', N'p.add(c)', N'PRJ311', CAST(N'2020-05-26T14:25:30.500' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31121', N'Which color is the darkest?', N'new Color(0, 0, 0)', N'new Color(10, 0, 0)', N'new Color(20, 0, 0)', N'new Color(30, 0, 0)', N'new Color(0, 0, 0)', N'PRJ311', CAST(N'2020-05-26T14:25:30.503' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31122', N'The method __________ sets the font (Helvetica, 20-point bold).', N'setFont(new Font("Helvetica", Font.BOLD, 20))', N'setFont(new Font("Helvetica", Font.bold, 20))', N'setFont(new Font("helvetica", BOLD, 20))', N'setFont(Font("Helvetica", Font.BOLD, 20))', N'setFont(new Font("Helvetica", Font.BOLD, 20))', N'PRJ311', CAST(N'2020-05-26T14:25:30.503' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31123', N'The setBackground method can be used to set a back ground color for _____.', N'All of the others', N'Component', N'Container', N'JComponent', N'All of the others', N'PRJ311', CAST(N'2020-05-26T14:25:30.503' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31124', N'The setBorder method can be used to set a border for _____.', N'JComponent', N'Component', N'Container', N'All of the others', N'JComponent', N'PRJ311', CAST(N'2020-05-26T14:25:30.503' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31125', N'You can use methods ___________ on any instance of java.awt.Component.', N'setBackground', N'setBorder', N'setLayout', N'All of the others', N'setBackground', N'PRJ311', CAST(N'2020-05-26T14:25:30.503' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31126', N'To create an image icon for a file in c:\book\image\icon, use ____________.', N'new ImageIcon("c:\\book\\image\\icon");', N'new ImageIcon("c:\book\image\icon");', N'new ImageIcon(''c:\book\image\icon'');', N'new ImageIcon(''c:\\book\\image\\icon'');', N'new ImageIcon("c:\\book\\image\\icon");', N'PRJ311', CAST(N'2020-05-26T14:25:30.507' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31127', N'Which of the following is true?', N'All of the others.', N'You can create a JButton by specifying an icon.', N'You can create a JButton by a text.', N'E. You can create a JButton using its default constructor.', N'All of the others.', N'PRJ311', CAST(N'2020-05-26T14:25:30.507' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31128', N'The method __________ gets the text (or caption) of the button b.', N'b.getText()', N'b.text()', N'b.findText()', N'b.retrieveText().', N'b.getText()', N'PRJ311', CAST(N'2020-05-26T14:25:30.507' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31129', N'The method __________ creates a IconImage for file c:\image\us.gif.', N'new ImageIcon("c:\\image\\us.gif");', N'new ImageIcon("c:\image\us.gif");', N'new Icon("c:\image\us.gif");', N'new Icon("c:\\image\\us.gif");', N'new ImageIcon("c:\\image\\us.gif");', N'PRJ311', CAST(N'2020-05-26T14:25:30.507' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ3113', N'Which of the following statements are true?', N'A container such as JFrame is also a component.', N'Every instance of Component can be added to a container.', N'All Swing GUI components are lightweight.', N'Swing GUI component classes are named with a prefix S.', N'A container such as JFrame is also a component.', N'PRJ311', CAST(N'2020-05-26T14:25:30.507' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31130', N'Which of the following are valid methods on the button jbt?', N'All of the others', N'jbt.setMnemonic(''A'');', N'jbt.setIconTextGap(50);', N'None of the others', N'All of the others', N'PRJ311', CAST(N'2020-05-26T14:25:30.507' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31131', N'_________ checks whether the JCheckBox check is selected.', N'check.isSelected()', N'check.getSelected()', N'check.selected()', N'check.select()', N'check.isSelected()', N'PRJ311', CAST(N'2020-05-26T14:25:30.507' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31132', N'Which of the following statements are true?', N'All of the others.', N'JCheckBox inherits from javax.swing.AbstractButton.', N'All the methods in JCheckBox are also in JButton.', N'You can use an icon on JCheckBox.', N'All of the others.', N'PRJ311', CAST(N'2020-05-26T14:25:30.507' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31133', N'Which of the following statements are true?', N'To check whether a radio button jrb is selected, use jrb.isSelected().', N'All of the others.', N'ButtonGroup can be added to a container.', N'When a radio button is created, the radio button is selected by default.', N'To check whether a radio button jrb is selected, use jrb.isSelected().', N'PRJ311', CAST(N'2020-05-26T14:25:30.507' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31134', N'The method __________ assigns the name Result to the Text of variable jlbl.', N'jlbl.setText("Result")', N'jlbl.newText("Result")', N'jlbl.text("Result")', N'jlbl.findText()', N'jlbl.setText("Result")', N'PRJ311', CAST(N'2020-05-26T14:25:30.510' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31135', N'___________ can be used to enter or display a string.', N'A text field', N'A label', N'A button', N'A check box', N'A text field', N'PRJ311', CAST(N'2020-05-26T14:25:30.510' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31136', N'Clicking a JButton object generates __________ events.', N'ActionEvent', N'ItemEvent', N'ComponentEvent', N'ContainerEvent', N'ActionEvent', N'PRJ311', CAST(N'2020-05-26T14:25:30.510' AS DateTime), N'1')
GO
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31137', N'The method __________ appends a string s into the text area jta.', N'jta.append(s)', N'jta.appendString(s)', N'jta.appendText(s)', N'jta.insertText(s)', N'jta.append(s)', N'PRJ311', CAST(N'2020-05-26T14:25:30.510' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31138', N'Which of the following statements are true?', N'You can specify the number of columns in a text area.', N'You can specify a horizontal text alignment in a text area.', N'You cannot disable editing on a text area.', N'All of the others.', N'You can specify the number of columns in a text area.', N'PRJ311', CAST(N'2020-05-26T14:25:30.510' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31139', N'To wrap a line in a text area jta, invoke ____________.', N'jta.setLineWrap(true)', N'jta.setLineWrap(false)', N'jta.WrapLine()', N'jta.wrapText()', N'jta.setLineWrap(true)', N'PRJ311', CAST(N'2020-05-26T14:25:30.510' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ3114', N'Which of the following classes is a heavyweight component?', N'JFrame', N'JButton', N'JTextField', N'JPanel', N'JFrame', N'PRJ311', CAST(N'2020-05-26T14:25:30.513' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31140', N'The method __________ adds a text area jta to a scrollpane jScrollPane.', N'jScrollPane.add(jta)', N'jScrollPane.insert(jta)', N'jScrollPane.addItem(jta)', N'None of the others', N'jScrollPane.add(jta)', N'PRJ311', CAST(N'2020-05-26T14:25:30.513' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31141', N'How many items can be selected from a JComboBox object at a time?', N'1', N'0', N'2', N'Unlimited', N'1', N'PRJ311', CAST(N'2020-05-26T14:25:30.513' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31142', N'_______________ returns the selected item on a JComboBox jcbo.', N'jcbo.getSelectedItem()', N'jcbo.getSelectedIndex()', N'jcbo.getSelectedIndices()', N'jcbo.getSelectedItems()', N'jcbo.getSelectedItem()', N'PRJ311', CAST(N'2020-05-26T14:25:30.513' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31143', N'The method __________ adds an item s into a JComboBox jcbo.', N'jcbo.addItem(s)', N'jcbo.add(s)', N'jcbo.addChoice(s)', N'jcbo.addObject(s)', N'jcbo.addItem(s)', N'PRJ311', CAST(N'2020-05-26T14:25:30.513' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31144', N'____________ is a component that enables the user to choose a single value or multiple values.', N'A list', N'A text field', N'A combo box', N'A label', N'A list', N'PRJ311', CAST(N'2020-05-26T14:25:30.513' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31145', N'______________ allows selections of multiple contiguous items without restrictions.', N'Multiple-interval selection', N'Multiple selection', N'ALl of the others', N'Single selection', N'Multiple-interval selection', N'PRJ311', CAST(N'2020-05-26T14:25:30.513' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31146', N'Clicking a JList object generates __________ events.', N'ActionEvent and ItemEvent', N'ItemEvent and ComponentEvent', N'ComponentEvent and ContainerEvent', N'ActionEvent and ContainerEvent', N'ActionEvent and ItemEvent', N'PRJ311', CAST(N'2020-05-26T14:25:30.517' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31147', N'The following is a property of a JScrollBar.', N'All of the others', N'maximum', N'orientation', N'visibleAmount', N'All of the others', N'PRJ311', CAST(N'2020-05-26T14:25:30.517' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31148', N'The coordinate of the upper-left corner of a frame is __________.', N'(0, 0)', N'(25, 25)', N'(100, 100)', N'(10, 10)', N'(0, 0)', N'PRJ311', CAST(N'2020-05-26T14:25:30.517' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ311480', N'What''s is AWT stands for?', N'A ', N'B', N'C', N'D', N'A', N'ENG', CAST(N'2020-05-29T11:56:29.173' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ311485', N'What''s is socket?', N'A', N'B', N'C', N'D', N'D', N'ENG', CAST(N'2020-05-29T11:55:16.160' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31149', N'The header for the paintComponent method is ________________.', N'protected void paintComponent(Graphics g)', N'private void paintComponent(Graphics g)', N'public void paintComponent(Graphics g)', N'protected void paintComponent()', N'protected void paintComponent(Graphics g)', N'PRJ311', CAST(N'2020-05-26T14:25:30.517' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ311495', N'What is the mission of Action Listener?', N'Nothing', N'Listen', N'Waiting', N'Execute', N'Listen', N'PRJ311', CAST(N'2020-05-29T19:43:02.253' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ311496', N'What What', N'A', N'B', N'C ', N'D', N'C', N'ENG', CAST(N'2020-05-29T11:51:17.313' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ311497', N'What is your name
', N'A', N'B', N'C', N'D', N'D', N'ENG', CAST(N'2020-05-29T11:48:38.723' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ311498', N'What What', N'A ', N'B', N'C ', N'D', N'A', N'PRJ311', CAST(N'2020-05-29T11:46:58.863' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ3115', N'Which component cannot be added to a container?', N'JFrame', N'JPanel', N'JButton', N'JComponent', N'JFrame', N'PRJ311', CAST(N'2020-05-26T14:25:30.517' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31150', N'You should override the __________ method to draw things on a Swing component.', N'paintComponent()', N'repaint()', N'update()', N'init()', N'paintComponent()', N'PRJ311', CAST(N'2020-05-26T14:25:30.517' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31151', N'To repaint graphics, invoke __________ on a Swing component.', N'repaint()', N'update()', N'paintComponent()', N'init()', N'repaint()', N'PRJ311', CAST(N'2020-05-26T14:25:30.520' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31152', N'The __________ method is used to create an Image object from an ImageIcon object imageIcon.', N'imageIcon.getImage()', N'imageIcon.image()', N'imageIcon.setImage()', N'imageIcon.returnImage()', N'imageIcon.getImage()', N'PRJ311', CAST(N'2020-05-26T14:25:30.520' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31153', N'When creating a server on a port that is already in use, __________.', N'java.net.BindException occurs.', N'the server is created with no problems.', N'the server is blocked until the port is available.', N'the server encounters a fatal error and must be terminated.', N'java.net.BindException occurs.', N'PRJ311', CAST(N'2020-05-26T14:25:30.520' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31154', N'When creating a client on a server port that is already in use, __________.', N'the client can connect to the server regardless of whether the port is in use.', N'java.net.BindException occurs.', N'the client is blocked until the port is available.', N'the client encounters a fatal error and must be terminated.', N'the client can connect to the server regardless of whether the port is in use.', N'PRJ311', CAST(N'2020-05-26T14:25:30.520' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31155', N'The server listens for a connection request from a client using the following statement:', N'Socket s = serverSocket.accept();', N'Socket s = new Socket(ServerName, port);', N'Socket s = serverSocket.getSocket();', N'Socket s = new Socket(ServerName);', N'Socket s = serverSocket.accept();', N'PRJ311', CAST(N'2020-05-26T14:25:30.523' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31156', N'When a client requests connection to a server that has not yet started, __________.', N'java.net.ConnectionException occurs.', N'java.net.BindException occurs.', N'the client is blocked until the server is started.', N'the client encounters a fatal error and must be terminated.', N'java.net.ConnectionException occurs.', N'PRJ311', CAST(N'2020-05-26T14:25:30.523' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31157', N'To create an InputStream on a socket s, you use __________.', N'InputStream in = s.getInputStream();', N'InputStream in = new InputStream(s);', N'InputStream in = s.obtainInputStream();', N'InputStream in = s.getStream();', N'InputStream in = s.getInputStream();', N'PRJ311', CAST(N'2020-05-26T14:25:30.523' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31158', N'You can invoke ______________ on a Socket s, to obtain an InetAddress object.', N's.InetAddress();', N's.getInetAddress();', N's.obtainInetAddress();', N's.retrieveInetAddress();', N's.InetAddress();', N'PRJ311', CAST(N'2020-05-26T14:25:30.523' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31159', N'The ____________ method in the InetAddress class returns the IP address.', N'getHostAddress()', N'getIP()', N'getIPAddress()', N'getAddress()', N'getHostAddress()', N'PRJ311', CAST(N'2020-05-26T14:25:30.523' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ3116', N'Which of the following is a subclass of java.awt.Component?', N'Container classes', N'All of the others', N'Helper classes such as Color and Font', N'None of the others', N'Container classes', N'PRJ311', CAST(N'2020-05-26T14:25:30.523' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31160', N'A ServerSocket can connect to ________ clients.', N'an unlimited number of', N'one', N'two', N'ten', N'an unlimited number of', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31161', N'The _____ layout places the components in rows and columns.', N'GridLayout', N'CardLayout', N'FlowLayout', N'Borderlayout', N'GridLayout', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31162', N'The default alignment of buttons in Flow Layout is ________.', N'CENTER', N'RIGHT', N'LEFT', N'The alignment must be defined when using the FlowLayout Manager.', N'CENTER', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31163', N'The default horizontal and vertical gap in BorderLayout is ________.', N'0 pixel', N'1 pixel', N'5 pixels', N'10 pixels', N'0 pixel', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31164', N'Which method is used to load a JDBC driver?', N'Class.forName()', N'class.load()', N'Class.load()', N'class.forName()', N'Class.forName()', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31165', N'Which method is used to commit the update of a ResultSet?', N'updateRow()', N'CommitRow()', N'commit()', N'update()', N'updateRow()', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31166', N'Which statements are INCORRECT about I18N?', N'The translation of text is the least time-consuming part of the localization process', N'Textual elements are stored outside the source code and retrieved dynamically', N'Localization is the process of adapting software for a specific region', N'None of the others', N'The translation of text is the least time-consuming part of the localization process', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31167', N'________ driver can interpret JDBC calls to the database-specific native call interface.', N'Type-2', N'Type-1', N'Type-4', N'Type-3', N'Type-2', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31168', N'________ driver can use a bridging technology that provides JDBC access via ODBC drivers.', N'Type-1', N'Type-4', N'Type-2', N'Type-3', N'Type-1', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31169', N'The _______ method wakes up all threads that are waiting for a monitor.', N'notifyAll()', N'notify()', N'join()', N'wait()', N'notifyAll()', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ3117', N'What is best to describe the relationship between a container and a SWing GUI object in the container?', N'Composition', N'Association', N'Aggregation', N'Inheritance', N'Composition', N'PRJ311', CAST(N'2020-05-26T14:25:30.527' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31170', N'What is the name of the Swing class that is used for frames?', N'JFrame', N'Window', N'Frame', N'SwingFrame', N'JFrame', N'PRJ311', CAST(N'2020-05-26T14:25:30.530' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31171', N'What method sets the size of the displayed JFrame?', N'setSize( int width, int height)', N'setSize( int height, int width)', N'setVisible( int width, int height)', N'setVisible( int height, int width)', N'setSize( int width, int height)', N'PRJ311', CAST(N'2020-05-26T14:25:30.530' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31172', N'The size of a frame on the screen is measured in:', N'pixels', N'inches', N'nits', N'dots', N'pixels', N'PRJ311', CAST(N'2020-05-26T14:25:30.530' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31173', N'What is the one component that nearly all GUI programs will have?', N'Frame', N'Mouse', N'Monitor', N'Button', N'Frame', N'PRJ311', CAST(N'2020-05-26T14:25:30.530' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ31174', N'What is S?', N'as', N'hj', N'gggggg', N'ghf', N'as', N'PRJ311', CAST(N'2020-05-26T14:25:30.530' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ3118', N'What is best to describe the relationship between a container and a layout manager?', N'Aggregation', N'Association', N'Composition', N'Inheritance', N'Aggregation', N'PRJ311', CAST(N'2020-05-26T14:25:30.530' AS DateTime), N'1')
INSERT [dbo].[Question] ([IdQuestion], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [IdSubject], [Date], [QuesStatus]) VALUES (N'PRJ3119', N'What is best to describe the relationship between JComponent and JButton?', N'Inheritance', N'Association', N'Aggregation', N'Composition', N'Inheritance', N'PRJ311', CAST(N'2020-05-26T14:25:30.530' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[QuizDetail] ON 

INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 10, 1, CAST(N'2020-05-31T14:24:29.760' AS DateTime), N'ENG', CAST(N'2020-05-31T14:24:41.553' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 10, 2, CAST(N'2020-05-31T14:26:18.407' AS DateTime), N'ENG', CAST(N'2020-05-31T14:26:34.257' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 10, 3, CAST(N'2020-05-31T14:29:37.470' AS DateTime), N'ENG', CAST(N'2020-05-31T14:29:49.117' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 6, 4, CAST(N'2020-05-31T14:31:04.460' AS DateTime), N'ENG', CAST(N'2020-05-31T14:31:16.177' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 10, 5, CAST(N'2020-05-31T15:06:35.597' AS DateTime), N'ENG', CAST(N'2020-05-31T15:06:43.627' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 2, 8, CAST(N'2020-05-31T15:15:16.143' AS DateTime), N'ENG', CAST(N'2020-05-31T15:15:58.663' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 6, 10, CAST(N'2020-05-31T15:17:37.327' AS DateTime), N'ENG', CAST(N'2020-05-31T15:20:10.440' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 6, 11, CAST(N'2020-05-31T15:19:45.247' AS DateTime), N'ENG', CAST(N'2020-05-31T15:20:10.440' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 0, 25, CAST(N'2020-05-31T23:23:30.873' AS DateTime), N'ENG', CAST(N'2020-05-31T23:23:37.790' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 2, 26, CAST(N'2020-05-31T23:24:14.230' AS DateTime), N'ENG', CAST(N'2020-05-31T23:24:18.610' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 2, 27, CAST(N'2020-05-31T23:24:53.270' AS DateTime), N'ENG', CAST(N'2020-05-31T23:24:58.600' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 0, 28, CAST(N'2020-05-31T23:26:08.060' AS DateTime), N'ENG', CAST(N'2020-05-31T23:26:12.790' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 2, 29, CAST(N'2020-05-31T23:27:27.617' AS DateTime), N'ENG', CAST(N'2020-05-31T23:27:44.553' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 0, 30, CAST(N'2020-05-31T23:28:57.140' AS DateTime), N'ENG', CAST(N'2020-05-31T23:30:40.867' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 0, 31, CAST(N'2020-05-31T23:30:33.020' AS DateTime), N'ENG', CAST(N'2020-05-31T23:30:40.867' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 0, 32, CAST(N'2020-05-31T23:31:35.280' AS DateTime), N'ENG', CAST(N'2020-05-31T23:31:53.803' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 4, 33, CAST(N'2020-05-31T23:33:23.787' AS DateTime), N'ENG', CAST(N'2020-05-31T23:33:32.793' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 2, 34, CAST(N'2020-05-31T23:35:56.160' AS DateTime), N'ENG', CAST(N'2020-05-31T23:36:00.060' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 4, 35, CAST(N'2020-05-31T23:36:31.463' AS DateTime), N'ENG', CAST(N'2020-05-31T23:43:02.233' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 4, 36, CAST(N'2020-05-31T23:41:43.643' AS DateTime), N'ENG', CAST(N'2020-05-31T23:43:02.233' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 4, 37, CAST(N'2020-05-31T23:42:42.593' AS DateTime), N'ENG', CAST(N'2020-05-31T23:43:02.233' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 6, 38, CAST(N'2020-05-31T23:51:30.593' AS DateTime), N'ENG', CAST(N'2020-05-31T23:51:50.380' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 4, 39, CAST(N'2020-05-31T23:52:47.917' AS DateTime), N'ENG', CAST(N'2020-05-31T23:53:07.383' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'anhhyse130145@fpt.edu.vn', 4, 40, CAST(N'2020-06-01T10:18:09.710' AS DateTime), N'ENG', CAST(N'2020-06-01T10:18:29.653' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 4, 41, CAST(N'2020-06-01T11:40:19.150' AS DateTime), N'ENG', CAST(N'2020-06-01T11:40:39.130' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 7.5999999046325684, 42, CAST(N'2020-06-01T11:40:52.627' AS DateTime), N'PRJ311', CAST(N'2020-06-01T11:42:26.417' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 10, 43, CAST(N'2020-06-01T13:11:57.457' AS DateTime), N'ENG', CAST(N'2020-06-01T13:12:18.490' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 0, 44, CAST(N'2020-06-01T13:12:33.693' AS DateTime), N'ENG', CAST(N'2020-06-01T13:12:48.503' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 2, 45, CAST(N'2020-06-01T13:44:33.830' AS DateTime), N'ENG', CAST(N'2020-06-01T13:45:14.937' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 2, 46, CAST(N'2020-06-01T13:44:39.180' AS DateTime), N'ENG', CAST(N'2020-06-01T13:45:14.937' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 2, 47, CAST(N'2020-06-01T13:44:49.143' AS DateTime), N'ENG', CAST(N'2020-06-01T13:45:14.937' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 8, 48, CAST(N'2020-06-01T13:45:45.420' AS DateTime), N'ENG', CAST(N'2020-06-01T13:46:05.247' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 10, 49, CAST(N'2020-06-01T13:56:46.207' AS DateTime), N'ENG', CAST(N'2020-06-01T13:57:33.187' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 0, 50, CAST(N'2020-06-01T13:57:51.907' AS DateTime), N'ENG', CAST(N'2020-06-01T14:01:35.007' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 0, 51, CAST(N'2020-06-01T14:01:14.437' AS DateTime), N'ENG', CAST(N'2020-06-01T14:01:35.007' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'giangnthse140109@fpt.edu.vn', 4, 52, CAST(N'2020-06-01T14:02:02.877' AS DateTime), N'ENG', CAST(N'2020-06-01T14:02:22.877' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 2, 53, CAST(N'2020-06-01T23:08:35.017' AS DateTime), N'ENG', CAST(N'2020-06-01T23:08:55.817' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 4, 54, CAST(N'2020-06-01T23:09:42.840' AS DateTime), N'ENG', CAST(N'2020-06-01T23:10:02.137' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 6, 55, CAST(N'2020-06-01T23:10:47.463' AS DateTime), N'ENG', CAST(N'2020-06-01T23:11:47.693' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 2, 56, CAST(N'2020-06-01T23:12:03.850' AS DateTime), N'ENG', CAST(N'2020-06-01T23:13:04.553' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 8, 57, CAST(N'2020-06-01T23:13:15.897' AS DateTime), N'ENG', CAST(N'2020-06-01T23:13:57.507' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 8, 58, CAST(N'2020-06-01T23:14:31.880' AS DateTime), N'ENG', CAST(N'2020-06-01T23:15:31.610' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 10, 59, CAST(N'2020-06-01T23:15:46.773' AS DateTime), N'ENG', CAST(N'2020-06-01T23:16:19.477' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 4, 60, CAST(N'2020-06-01T23:16:29.493' AS DateTime), N'ENG', CAST(N'2020-06-01T23:17:28.823' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 8, 61, CAST(N'2020-06-01T23:19:13.233' AS DateTime), N'ENG', CAST(N'2020-06-01T23:19:44.483' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 10, 62, CAST(N'2020-06-01T23:19:58.180' AS DateTime), N'ENG', CAST(N'2020-06-01T23:20:57.480' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 3.1999998092651367, 63, CAST(N'2020-06-01T23:21:07.730' AS DateTime), N'PRJ311', CAST(N'2020-06-01T23:33:22.743' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 8, 64, CAST(N'2020-06-01T23:45:19.763' AS DateTime), N'ENG', CAST(N'2020-06-01T23:46:24.823' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'leeminhha256@gmail.com', 8, 65, CAST(N'2020-06-01T23:46:46.667' AS DateTime), N'ENG', CAST(N'2020-06-01T23:48:36.273' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'votantai4899@gmail.com', 2, 66, CAST(N'2020-06-02T15:58:50.570' AS DateTime), N'ENG', CAST(N'2020-06-02T15:59:15.573' AS DateTime))
INSERT [dbo].[QuizDetail] ([Email], [Score], [IdQuiz], [DoingDate], [IdSubject], [FinishTime]) VALUES (N'khoaphdse140609@fpt.edu.vn', 10, 67, CAST(N'2020-06-02T20:13:47.400' AS DateTime), N'ENG', CAST(N'2020-06-02T20:15:47.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[QuizDetail] OFF
INSERT [dbo].[QuizUser] ([Email], [Name], [Password], [Status], [Role], [Code]) VALUES (N'giangnthse140109@fpt.edu.vn', N'Nguyen Thi Huong Giang', N'40bd001563085fc35165329ea1ff5c5ecbdbbeef', N'Active', N'student', N'395416')
INSERT [dbo].[QuizUser] ([Email], [Name], [Password], [Status], [Role], [Code]) VALUES (N'anhhyse130145@fpt.edu.vn', N'Tran Trinh Dang Huy', N'40bd001563085fc35165329ea1ff5c5ecbdbbeef', N'Active', N'admin', N'778318')
INSERT [dbo].[QuizUser] ([Email], [Name], [Password], [Status], [Role], [Code]) VALUES (N'khoaphdse140609@fpt.edu.vn', N'Khoa', N'7c4a8d09ca3762af61e59520943dc26494f8941b', N'Active', N'student', N'088547')
INSERT [dbo].[QuizUser] ([Email], [Name], [Password], [Status], [Role], [Code]) VALUES (N'leeminhha256@gmail.com', N'Le Minh Ha', N'50358cde9e3176993d4e1140dc21241c44875659', N'Active', N'student', N'051324')
INSERT [dbo].[QuizUser] ([Email], [Name], [Password], [Status], [Role], [Code]) VALUES (N'trinmse140329@fpt.edu.vn', N'Nguyen Minh Tri', N'40bd001563085fc35165329ea1ff5c5ecbdbbeef', N'Active', N'student', N'958116')
INSERT [dbo].[QuizUser] ([Email], [Name], [Password], [Status], [Role], [Code]) VALUES (N'votantai4899@gmail.com', N'Vo Tam Tai', N'ded8c700f67f6de1ce91f2f83643ce36fc66b3df', N'Active', N'student', N'385134')
INSERT [dbo].[Subject] ([IdSubject], [NameSubject], [SubStatus], [NumQuestion], [Time]) VALUES (N'ENG', N'English', 1, 5, CAST(N'00:02:00' AS Time))
INSERT [dbo].[Subject] ([IdSubject], [NameSubject], [SubStatus], [NumQuestion], [Time]) VALUES (N'PRJ311', N'JavaWeb', 1, 50, CAST(N'01:10:00' AS Time))
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF_Question_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[QuizDetail] ADD  CONSTRAINT [DF_QuizDetail_DoingDate]  DEFAULT (getdate()) FOR [DoingDate]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([IdSubject])
REFERENCES [dbo].[Subject] ([IdSubject])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[QuizDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuizDetail_QuizUser] FOREIGN KEY([Email])
REFERENCES [dbo].[QuizUser] ([Email])
GO
ALTER TABLE [dbo].[QuizDetail] CHECK CONSTRAINT [FK_QuizDetail_QuizUser]
GO
ALTER TABLE [dbo].[QuizDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuizDetail_Subject] FOREIGN KEY([IdSubject])
REFERENCES [dbo].[Subject] ([IdSubject])
GO
ALTER TABLE [dbo].[QuizDetail] CHECK CONSTRAINT [FK_QuizDetail_Subject]
GO
USE [master]
GO
ALTER DATABASE [QuizOnl] SET  READ_WRITE 
GO
