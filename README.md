# Turbo Hashing Benchmark

This monorepo is designed to benchmark the speed of hashing a 10GB file using various implementations and package managers. The goal is to compare the performance of different languages and tools in a consistent environment.

## Purpose

The purpose of this codebase is to provide a comprehensive benchmarking suite that allows developers to compare the performance of hashing algorithms across different languages and package managers. This includes:

- Rust
- TypeScript using pnpm as a package manager and ts-node
- TypeScript using pnpm as a package manager and tsx as a runner
- TypeScript using Deno as a package manager and runner
- TypeScript using Bun as a package manager and runner
- General JavaScript version using Node as a package manager

## Structure

Each implementation is organized as a separate app within the monorepo. This allows for easy addition of new languages and package managers in the future.

## Commands

At the monorepo level, you can use the following commands:

- `turbo build`: Build all the apps in the monorepo.
- `turbo benchmark`: Run the benchmark tests across all implementations.

## Additional Resources

For more detailed information on the overall structure and setup of the turborepo, please refer to the [README-TURBO.md](./README-TURBO.md).

## Getting Started

To get started with the benchmark tests, follow these steps:

1. Clone the repository.
2. Install the necessary dependencies for each app.
3. Run the `turbo build` command to build all the apps.
4. Run the `turbo benchmark` command to execute the benchmark tests.

## Contributing

Contributions are welcome! If you have an idea for a new implementation or improvement, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.
