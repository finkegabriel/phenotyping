use postgres::{Client,NoTls,Error};

pub fn main() -> Result<(), Error>{
    let client = Client::connect("postgresql://postgres:password@127.0.0.1/phenotyping",NoTls);


    client.batch_execute("
        CREATE TABLE IF NOT EXISTS plant (
            id              SERIAL PRIMARY KEY,
            type            VARCHAR NOT NULL
            )
    ")?;


    Ok(())
}
