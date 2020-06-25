mod migrations;
use std::io;

fn main(){
    let mut input = String::new();
    let mut done = true;

    migrations::drop();
    migrations::migrate();
    migrations::seed();
    println!("{}","Done!");

    while done{
        match io::stdin().read_line(&mut input){
            Ok(n)=>{
                println!("{}",input);
                if input.contains("insert"){
                    println!("{}","insert into");
                }
                
                if input.contains("delete"){
                    println!("{}","del");
                }
                if input.contains("quit"){
                    println!("{}","quit");
                    done = false;
                }
                input = "".to_string();
            }
            Err(error) => println!("error: {}", error),
        }
    }
}
