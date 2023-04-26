/*==============================================================*/
/* Table: Broker                                                */
/*==============================================================*/
create table Broker
(
   b_ID                 int not null  comment '',
   primary key (b_ID)
);

/*==============================================================*/
/* Table: Client                                                */
/*==============================================================*/
create table Client
(
   b_ID                 int not null  comment '',
   p_ID                 int not null  comment '',
   c_ID                 int not null  comment '',
   Name                 text  comment '',
   Surname              text  comment '',
   Phone                text  comment '',
   Home_Phone           text  comment '',
   Mail                 text  comment '',
   Passport             text  comment '',
   primary key (b_ID, p_ID, c_ID)
);

/*==============================================================*/
/* Table: Deal                                                  */
/*==============================================================*/
create table Deal
(
   d_ID                 int not null  comment '',
   p_ID                 int not null  comment '',
   Cli_b_ID             int not null  comment '',
   Cli_p_ID             int not null  comment '',
   Cli_c_ID             int not null  comment '',
   b_ID                 int not null  comment '',
   Date                 date  comment '',
   Sum                  float(8,2)  comment '',
   Broker_Percentage    int  comment '',
   primary key (d_ID)
);

/*==============================================================*/
/* Table: Person                                                */
/*==============================================================*/
create table Person
(
   b_ID                 int not null  comment '',
   p_ID                 int not null  comment '',
   Name                 text  comment '',
   Surname              text  comment '',
   Phone                text  comment '',
   Home_Phone           text  comment '',
   Mail                 text  comment '',
   primary key (b_ID, p_ID)
);

/*==============================================================*/
/* Table: Property                                              */
/*==============================================================*/
create table Property
(
   p_ID                 int not null  comment '',
   b_ID                 int not null  comment '',
   Cli_p_ID             int not null  comment '',
   Cli_own_ID           int not null  comment '',
   Name                 text  comment '',
   Address              text  comment '',
   Price                int  comment '',
   primary key (p_ID)
);

alter table Client add constraint FK_CLIENT_INHERITAN_PERSON foreign key (b_ID, p_ID)
      references Person (b_ID, p_ID) on delete restrict on update restrict;

alter table Deal add constraint FK_DEAL_CREATE_BROKER foreign key (b_ID)
      references Broker (b_ID) on delete restrict on update restrict;

alter table Deal add constraint FK_DEAL_RELATIONS_CLIENT foreign key (Cli_b_ID, Cli_p_ID, Cli_c_ID)
      references Client (b_ID, p_ID, c_ID) on delete restrict on update restrict;

alter table Deal add constraint FK_DEAL_RELATIONS_PROPERTY foreign key (p_ID)
      references Property (p_ID) on delete restrict on update restrict;

alter table Person add constraint FK_PERSON_INHERITAN_BROKER foreign key (b_ID)
      references Broker (b_ID) on delete restrict on update restrict;

alter table Property add constraint FK_PROPERTY_OWNS_CLIENT foreign key (b_ID, Cli_p_ID, Cli_own_ID)
      references Client (b_ID, p_ID, c_ID) on delete restrict on update restrict;

