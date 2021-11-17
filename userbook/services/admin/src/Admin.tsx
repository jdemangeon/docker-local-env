import * as React from "react";
import { Admin, Resource } from "react-admin";
import simpleRestProvider from "ra-data-simple-rest";

import { UserList, UserEdit, UserCreate } from "./users";

export default () => (
  <Admin
    dataProvider={simpleRestProvider(import.meta.env.VITE_API_PUBLIC_BASE_URL)}
  >
    <Resource
      name="users"
      list={UserList}
      edit={UserEdit}
      create={UserCreate}
    />
  </Admin>
);
