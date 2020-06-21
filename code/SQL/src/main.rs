mod migrations;

fn main() {
    migrations::drop();
    migrations::migrate();
    migrations::seed();
    println!("{}","Done!");
}
