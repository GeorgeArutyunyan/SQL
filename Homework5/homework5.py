import psycopg2
import os
from config import database_name, user_name, user_password


class DataBase:
    """Class got two argument and create DB initially
        firtst argument it is username for connection to postgreSQL
        second DB name which want to create"""

    def __init__(self, user: str, name: str):
        self.user = user
        self.name = name
        # os.system("createdb -U %s %s" % (user, name))

    def create_table(self, con, cur, table_name: str, **kwargs) -> str:
        cur.execute("""
                    CREATE TABLE IF NOT EXISTS %s (
                    %s_id SERIAL PRIMARY KEY);
                    """ % (table_name, table_name))
        con.commit()
        for key, value in kwargs.items():
            cur.execute("""ALTER TABLE %s 
                                ADD COLUMN %s %s;
                        """ % (table_name, key, value))
            con.commit()
        return "Table %s was create" % table_name


class Client:

    def __init__(self, first_name, last_name, email, phone_number=None):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.phone_number = phone_number
        self.info = {'first_name': first_name, 'last_name': last_name, 'email': email, 'phone_number': phone_number}

    def add_client(self, con, cur, table_name: str) -> str:
        desc = "'" + "', '".join(value for value in self.info.values()) + "'"
        sql_string = f"""
                    INSERT INTO client (first_name, last_name, email, phone_number)
                    VALUES (%s);""" % desc
        cur.execute(sql_string)
        con.commit()
        return "Client %s was add in DB" % self.last_name

    def add_phone_number(self, con, cur, table_name: str, client_id: int, phone_number: str) -> str:
        cur.execute("""
                    INSERT INTO %s ("client_id", "phone_number")
                    VALUES (%s, %s);
                    """ % (table_name, client_id, phone_number))
        con.commit()
        return "Phone number %s for client id %s was add" % (client_id, phone_number)

    def change_info(self, con, cur, table_name: str, client_id: int, **kwargs) -> str:
        for key, value in kwargs.items():
            cur.execute("""
                        UPDATE %s
                        SET %s = '%s'
                        WHERE client_id = %s;
                        """ % (table_name, key, value, client_id))
            con.commit()
        return "Information about client %s was update" % client_id

    def delete_phone(self, con, cur, table_name: str, client_id: int, phone_number: str) -> str:
        cur.execute(""" 
                    DELETE FROM %s
                    WHERE client_id = %s AND phone_number = '%s';
                    """ % (table_name, client_id, phone_number))
        con.commit()
        return "phone for %s was deleted" % client_id

    def delete_client(self, con, cur, talbe_name: str, client_id: int) -> str:
        cur.execute("""
                    DELETE FROM %s
                    WHERE client_id = %s;
                    """ % (talbe_name, client_id))
        con.commit()
        return "Cliet %s was deleted" % client_id

    def search_client(self, cur, **kwargs) -> str:
        for key, value in kwargs.items():
            cur.execute("""
                        SELECT * FROM client
                        INNER JOIN phones USING (client_id)
                        WHERE %s = '%s';""" % (key, value))
            res = cur.fetchall()
            if res:
                return res
        return 'No client in DataBase'


if __name__ == '__main__':
    netology = DataBase(user_name, database_name)
    client = Client('Roland', 'Deschein', 'r.deschein@gmail.com', '19191991')
    con = psycopg2.connect(database=database_name, user=user_name, password=user_password)
    with con:
        with con.cursor() as cur:
            netology.create_table(con, cur, 'client', first_name='VARCHAR(30)', last_name='VARCHAR(30)',
                                  email='VARCHAR(30) UNIQUE', phone_number='VARCHAR(17)')
            netology.create_table(con, cur, 'phones', client_id='INTEGER REFERENCES client(client_id)',
                                  phone_number='VARCHAR(30)')
            client.add_client(con, cur, 'client')
            client.add_phone_number(con, cur, 'phones', 1, '19919191')
            client.change_info(con, cur, 'client', 1, email='gunslinger@gmail.com')
            client.delete_phone(con, cur, 'phones', 1, '19919191')
            client.search_client(cur, last_name='Deschein')
            client.delete_client(con, cur, 'client', 1)