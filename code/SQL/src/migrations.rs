use postgres::{Client, NoTls, Error};

pub fn migrate() -> Result<(), Error>{
    let mut client = Client::connect("postgresql://postgres:password@127.0.0.1/phenotyping",NoTls)?;

    client.batch_execute("
        CREATE TABLE IF NOT EXISTS plant (
            id              SERIAL PRIMARY KEY,
            type            VARCHAR NOT NULL,
            data            json
            )
    ")?;
    

    Ok(())
}

pub fn drop() -> Result<(), Error>{
    let mut client = Client::connect("postgresql://postgres:password@127.0.0.1/phenotyping",NoTls)?;

    client.batch_execute("drop table plant");

    Ok(())
}
