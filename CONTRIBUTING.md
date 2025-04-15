# Contributing to the Project

Thank you for considering contributing to our project! We welcome contributions from the community and are excited to collaborate with you. Please follow these guidelines to ensure a smooth contribution process.

## Pull Request Process

1. **Fork the Repository**: Start by forking the repository to your own GitHub account.

2. **Clone the Repository**: Clone your forked repository to your local machine.

   ```bash
   git clone https://github.com/your-username/repository-name.git
   ```

3. **Create a Branch**: Create a new branch for your feature or bug fix.

   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Make Changes**: Implement your changes in the codebase.

5. **Commit Changes**: Commit your changes with a clear and descriptive commit message.

   ```bash
   git commit -m "Add feature: description of the feature"
   ```

6. **Rebase**: Before pushing your changes, ensure your branch is up to date with the main branch by rebasing.

   ```bash
   git fetch origin
   git rebase origin/main
   ```

7. **Push Changes**: Push your changes to your forked repository.

   ```bash
   git push origin feature/your-feature-name
   ```

8. **Open a Pull Request**: Navigate to the original repository and open a pull request from your branch. Ensure the pull request is made against the `main` branch.

## Merging Process

- All pull requests must be reviewed and approved by at least one other contributor before merging.
- Ensure that your pull request passes all CI tests before requesting a review.
- Once approved, your pull request will be merged into the `main` branch.

## Continuous Integration

- Our project uses continuous integration (CI) to ensure code quality and functionality.
- All tests must pass in the CI pipeline before a pull request can be merged.
- If your pull request fails any tests, please address the issues and push the changes again.

## Code of Conduct

- Please adhere to our [Code of Conduct](CODE_OF_CONDUCT.md) in all interactions.

Thank you for your contributions!
