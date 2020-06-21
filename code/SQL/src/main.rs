mod migrations;

fn main() {
    migrations::drop();
    migrations::migrate();
    println!("{}","Done!");
}
