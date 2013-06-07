
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/07/2013 18:31:44
-- Generated from EDMX file: D:\Work\Git\SportTracker\SportTracker.Domain\ModelSportTracker.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SportTracker];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserBodyStamp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BodyStamps] DROP CONSTRAINT [FK_UserBodyStamp];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_UserUser];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProgram]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Programs] DROP CONSTRAINT [FK_UserProgram];
GO
IF OBJECT_ID(N'[dbo].[FK_UserTweet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tweets] DROP CONSTRAINT [FK_UserTweet];
GO
IF OBJECT_ID(N'[dbo].[FK_ExcerciseMuscle_Excercise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ExcerciseMuscle] DROP CONSTRAINT [FK_ExcerciseMuscle_Excercise];
GO
IF OBJECT_ID(N'[dbo].[FK_ExcerciseMuscle_Muscle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ExcerciseMuscle] DROP CONSTRAINT [FK_ExcerciseMuscle_Muscle];
GO
IF OBJECT_ID(N'[dbo].[FK_ExcerciseProgramExcercise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProgramExcercises] DROP CONSTRAINT [FK_ExcerciseProgramExcercise];
GO
IF OBJECT_ID(N'[dbo].[FK_StatisticExcercise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Statistics] DROP CONSTRAINT [FK_StatisticExcercise];
GO
IF OBJECT_ID(N'[dbo].[FK_ProgramTraining]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Trainings] DROP CONSTRAINT [FK_ProgramTraining];
GO
IF OBJECT_ID(N'[dbo].[FK_UserTraining]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Trainings] DROP CONSTRAINT [FK_UserTraining];
GO
IF OBJECT_ID(N'[dbo].[FK_ProgramProgramExcercise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProgramExcercises] DROP CONSTRAINT [FK_ProgramProgramExcercise];
GO
IF OBJECT_ID(N'[dbo].[FK_TrainingStatistic]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Statistics] DROP CONSTRAINT [FK_TrainingStatistic];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Muscles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Muscles];
GO
IF OBJECT_ID(N'[dbo].[Excercises]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Excercises];
GO
IF OBJECT_ID(N'[dbo].[ProgramExcercises]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProgramExcercises];
GO
IF OBJECT_ID(N'[dbo].[Statistics]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Statistics];
GO
IF OBJECT_ID(N'[dbo].[Trainings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Trainings];
GO
IF OBJECT_ID(N'[dbo].[BodyStamps]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BodyStamps];
GO
IF OBJECT_ID(N'[dbo].[Tweets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tweets];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Programs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Programs];
GO
IF OBJECT_ID(N'[dbo].[ExcerciseMuscle]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ExcerciseMuscle];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Muscles'
CREATE TABLE [dbo].[Muscles] (
    [MuscleId] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Excercises'
CREATE TABLE [dbo].[Excercises] (
    [ExcerciseId] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Complexity] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Url] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProgramExcercises'
CREATE TABLE [dbo].[ProgramExcercises] (
    [ProgramExcerciseId] uniqueidentifier  NOT NULL,
    [Day] nvarchar(max)  NOT NULL,
    [Order] smallint  NOT NULL,
    [SetCounts] nvarchar(max)  NOT NULL,
    [RepsScheme] nvarchar(max)  NOT NULL,
    [ProgramProgramId] uniqueidentifier  NOT NULL,
    [Excercise_ExcerciseId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Statistics'
CREATE TABLE [dbo].[Statistics] (
    [StatisticId] uniqueidentifier  NOT NULL,
    [SetNumber] smallint  NOT NULL,
    [RepsCount] smallint  NOT NULL,
    [Weight] float  NOT NULL,
    [Note] nvarchar(max)  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Excercise_ExcerciseId] uniqueidentifier  NOT NULL,
    [Training_TrainingId] uniqueidentifier  NULL
);
GO

-- Creating table 'Trainings'
CREATE TABLE [dbo].[Trainings] (
    [TrainingId] uniqueidentifier  NOT NULL,
    [StartDate] datetime  NULL,
    [Shift] int  NULL,
    [IsActive] bit  NOT NULL,
    [Program_ProgramId] uniqueidentifier  NOT NULL,
    [User_UserId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'BodyStamps'
CREATE TABLE [dbo].[BodyStamps] (
    [BodyStampId] bigint IDENTITY(1,1) NOT NULL,
    [UserUserId] uniqueidentifier  NOT NULL,
    [Weight] float  NOT NULL,
    [Height] float  NOT NULL,
    [Biceps] float  NOT NULL,
    [Waist] float  NOT NULL,
    [Date] datetime  NOT NULL,
    [User_UserId] uniqueidentifier  NULL
);
GO

-- Creating table 'Tweets'
CREATE TABLE [dbo].[Tweets] (
    [TweetId] int IDENTITY(1,1) NOT NULL,
    [UserUserId] uniqueidentifier  NOT NULL,
    [Message] nvarchar(max)  NOT NULL,
    [DateTime] datetime  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Role] nvarchar(max)  NOT NULL,
    [UserUser_User1_UserId] uniqueidentifier  NULL
);
GO

-- Creating table 'Programs'
CREATE TABLE [dbo].[Programs] (
    [ProgramId] uniqueidentifier  NOT NULL,
    [UserUserId] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [IsOpenToWorld] bit  NOT NULL,
    [Cost] decimal(18,0)  NULL,
    [Author] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ExcerciseMuscle'
CREATE TABLE [dbo].[ExcerciseMuscle] (
    [Excercises_ExcerciseId] uniqueidentifier  NOT NULL,
    [Muscles_MuscleId] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MuscleId] in table 'Muscles'
ALTER TABLE [dbo].[Muscles]
ADD CONSTRAINT [PK_Muscles]
    PRIMARY KEY CLUSTERED ([MuscleId] ASC);
GO

-- Creating primary key on [ExcerciseId] in table 'Excercises'
ALTER TABLE [dbo].[Excercises]
ADD CONSTRAINT [PK_Excercises]
    PRIMARY KEY CLUSTERED ([ExcerciseId] ASC);
GO

-- Creating primary key on [ProgramExcerciseId] in table 'ProgramExcercises'
ALTER TABLE [dbo].[ProgramExcercises]
ADD CONSTRAINT [PK_ProgramExcercises]
    PRIMARY KEY CLUSTERED ([ProgramExcerciseId] ASC);
GO

-- Creating primary key on [StatisticId] in table 'Statistics'
ALTER TABLE [dbo].[Statistics]
ADD CONSTRAINT [PK_Statistics]
    PRIMARY KEY CLUSTERED ([StatisticId] ASC);
GO

-- Creating primary key on [TrainingId] in table 'Trainings'
ALTER TABLE [dbo].[Trainings]
ADD CONSTRAINT [PK_Trainings]
    PRIMARY KEY CLUSTERED ([TrainingId] ASC);
GO

-- Creating primary key on [BodyStampId] in table 'BodyStamps'
ALTER TABLE [dbo].[BodyStamps]
ADD CONSTRAINT [PK_BodyStamps]
    PRIMARY KEY CLUSTERED ([BodyStampId] ASC);
GO

-- Creating primary key on [TweetId] in table 'Tweets'
ALTER TABLE [dbo].[Tweets]
ADD CONSTRAINT [PK_Tweets]
    PRIMARY KEY CLUSTERED ([TweetId] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [ProgramId] in table 'Programs'
ALTER TABLE [dbo].[Programs]
ADD CONSTRAINT [PK_Programs]
    PRIMARY KEY CLUSTERED ([ProgramId] ASC);
GO

-- Creating primary key on [Excercises_ExcerciseId], [Muscles_MuscleId] in table 'ExcerciseMuscle'
ALTER TABLE [dbo].[ExcerciseMuscle]
ADD CONSTRAINT [PK_ExcerciseMuscle]
    PRIMARY KEY NONCLUSTERED ([Excercises_ExcerciseId], [Muscles_MuscleId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_UserId] in table 'BodyStamps'
ALTER TABLE [dbo].[BodyStamps]
ADD CONSTRAINT [FK_UserBodyStamp]
    FOREIGN KEY ([User_UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserBodyStamp'
CREATE INDEX [IX_FK_UserBodyStamp]
ON [dbo].[BodyStamps]
    ([User_UserId]);
GO

-- Creating foreign key on [UserUser_User1_UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserUser]
    FOREIGN KEY ([UserUser_User1_UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUser'
CREATE INDEX [IX_FK_UserUser]
ON [dbo].[Users]
    ([UserUser_User1_UserId]);
GO

-- Creating foreign key on [UserUserId] in table 'Programs'
ALTER TABLE [dbo].[Programs]
ADD CONSTRAINT [FK_UserProgram]
    FOREIGN KEY ([UserUserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProgram'
CREATE INDEX [IX_FK_UserProgram]
ON [dbo].[Programs]
    ([UserUserId]);
GO

-- Creating foreign key on [UserUserId] in table 'Tweets'
ALTER TABLE [dbo].[Tweets]
ADD CONSTRAINT [FK_UserTweet]
    FOREIGN KEY ([UserUserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTweet'
CREATE INDEX [IX_FK_UserTweet]
ON [dbo].[Tweets]
    ([UserUserId]);
GO

-- Creating foreign key on [Excercises_ExcerciseId] in table 'ExcerciseMuscle'
ALTER TABLE [dbo].[ExcerciseMuscle]
ADD CONSTRAINT [FK_ExcerciseMuscle_Excercise]
    FOREIGN KEY ([Excercises_ExcerciseId])
    REFERENCES [dbo].[Excercises]
        ([ExcerciseId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Muscles_MuscleId] in table 'ExcerciseMuscle'
ALTER TABLE [dbo].[ExcerciseMuscle]
ADD CONSTRAINT [FK_ExcerciseMuscle_Muscle]
    FOREIGN KEY ([Muscles_MuscleId])
    REFERENCES [dbo].[Muscles]
        ([MuscleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExcerciseMuscle_Muscle'
CREATE INDEX [IX_FK_ExcerciseMuscle_Muscle]
ON [dbo].[ExcerciseMuscle]
    ([Muscles_MuscleId]);
GO

-- Creating foreign key on [Excercise_ExcerciseId] in table 'ProgramExcercises'
ALTER TABLE [dbo].[ProgramExcercises]
ADD CONSTRAINT [FK_ExcerciseProgramExcercise]
    FOREIGN KEY ([Excercise_ExcerciseId])
    REFERENCES [dbo].[Excercises]
        ([ExcerciseId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ExcerciseProgramExcercise'
CREATE INDEX [IX_FK_ExcerciseProgramExcercise]
ON [dbo].[ProgramExcercises]
    ([Excercise_ExcerciseId]);
GO

-- Creating foreign key on [Excercise_ExcerciseId] in table 'Statistics'
ALTER TABLE [dbo].[Statistics]
ADD CONSTRAINT [FK_StatisticExcercise]
    FOREIGN KEY ([Excercise_ExcerciseId])
    REFERENCES [dbo].[Excercises]
        ([ExcerciseId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StatisticExcercise'
CREATE INDEX [IX_FK_StatisticExcercise]
ON [dbo].[Statistics]
    ([Excercise_ExcerciseId]);
GO

-- Creating foreign key on [Program_ProgramId] in table 'Trainings'
ALTER TABLE [dbo].[Trainings]
ADD CONSTRAINT [FK_ProgramTraining]
    FOREIGN KEY ([Program_ProgramId])
    REFERENCES [dbo].[Programs]
        ([ProgramId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProgramTraining'
CREATE INDEX [IX_FK_ProgramTraining]
ON [dbo].[Trainings]
    ([Program_ProgramId]);
GO

-- Creating foreign key on [User_UserId] in table 'Trainings'
ALTER TABLE [dbo].[Trainings]
ADD CONSTRAINT [FK_UserTraining]
    FOREIGN KEY ([User_UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTraining'
CREATE INDEX [IX_FK_UserTraining]
ON [dbo].[Trainings]
    ([User_UserId]);
GO

-- Creating foreign key on [ProgramProgramId] in table 'ProgramExcercises'
ALTER TABLE [dbo].[ProgramExcercises]
ADD CONSTRAINT [FK_ProgramProgramExcercise]
    FOREIGN KEY ([ProgramProgramId])
    REFERENCES [dbo].[Programs]
        ([ProgramId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProgramProgramExcercise'
CREATE INDEX [IX_FK_ProgramProgramExcercise]
ON [dbo].[ProgramExcercises]
    ([ProgramProgramId]);
GO

-- Creating foreign key on [Training_TrainingId] in table 'Statistics'
ALTER TABLE [dbo].[Statistics]
ADD CONSTRAINT [FK_TrainingStatistic]
    FOREIGN KEY ([Training_TrainingId])
    REFERENCES [dbo].[Trainings]
        ([TrainingId])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainingStatistic'
CREATE INDEX [IX_FK_TrainingStatistic]
ON [dbo].[Statistics]
    ([Training_TrainingId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------