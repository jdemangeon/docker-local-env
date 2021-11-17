import * as React from "react";

import {
  List,
  Datagrid,
  Edit,
  Create,
  SimpleForm,
  TextField,
  TextInput,
} from "react-admin";

export const UserList = (props: any) => (
  <List {...props}>
    <Datagrid>
      <TextField source="id" />
      <TextField source="first_name" />
      <TextField source="last_name" />
    </Datagrid>
  </List>
);

const UserTitle = ({ record }: any) => {
  return (
    <span>
      User {record ? `"${record.first_name} - ${record.last_name}"` : ""}
    </span>
  );
};

export const UserEdit = (props: any) => (
  <Edit title={<UserTitle />} {...props}>
    <SimpleForm>
      <TextInput disabled source="id" />
      <TextInput source="first_name" />
      <TextInput source="last_name" />
    </SimpleForm>
  </Edit>
);

export const UserCreate = (props: any) => (
  <Create title="Create a User" {...props}>
    <SimpleForm>
      <TextInput source="first_name" />
      <TextInput source="last_name" />
    </SimpleForm>
  </Create>
);
