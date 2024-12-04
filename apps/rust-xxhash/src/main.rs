use std::fs::File;
use std::io::{BufReader, Read};
use xxhash_rust::xxh3::xxh3_64;

fn main() {
    let file_path = "path/to/10GB.file";
    let file = File::open(file_path).expect("Failed to open file");
    let mut reader = BufReader::new(file);

    let mut buffer = vec![0; 8192];
    let mut hasher = xxh3_64();

    let start = std::time::Instant::now();
    while let Ok(n) = reader.read(&mut buffer) {
        if n == 0 {
            break;
        }
        hasher = xxh3_64(&buffer[..n]);
    }
    let duration = start.elapsed();

    println!("Hash: {:x}", hasher);
    println!("Time taken: {:.2?}", duration);
}
