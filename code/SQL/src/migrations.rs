use postgres::{Client, NoTls, Error};

mod keys;

struct Plant {
    id: i32,
    r#type: String
}

struct Plant_Types {
    id: i32,
    r#type: String
}

pub fn migrate() -> Result<(), Error>{
    let mut client = Client::connect(keys::sec(),NoTls)?;
    client.batch_execute("
        CREATE TABLE IF NOT EXISTS plant (
            id              SERIAL PRIMARY KEY,
            type            VARCHAR,
            data            json
            )
    ")?;

    client.batch_execute("
    CREATE TABLE IF NOT EXISTS plant_types(
     id                 SERIAL PRIMARY KEY,
     type               VARCHAR
     ) 
    ")?;

    Ok(())
}

pub fn drop() -> Result<(), Error>{
    let mut client = Client::connect(keys::sec(),NoTls)?;

    client.batch_execute("drop table plant")?;
    client.batch_execute("drop table plant_types");

    Ok(())
}

pub fn seed() -> Result<(),Error>{
   let mut client =  Client::connect(keys::sec(),NoTls)?; 

    client.batch_execute("
     INSERT into plant_types (id,type) values('1','WOODCHIP');
     INSERT into plant_types (id,type) values('2','BEAN');
     ")?;

    Ok(())
}

pub fn insert () -> Result<(), Error>{

    Ok(())
}
