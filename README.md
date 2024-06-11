# 🔑Password Box

Password Box is an iOS app designed to store passwords that cannot be managed by conventional password management tools like iCloud Keychain. It addresses the need to securely store a variety of real-world passcodes that typical password managers can’t handle, such as computer passcodes for different operating systems at the office, bike lock combinations, and more.

Often, the passwords we create ourselves contain unconscious patterns, such as favorite characters, birthdays, or even car license plate numbers. These predictable patterns can lead to dangerous security breaches. Password Box aims to solve these issues.

All data is stored locally on the user’s device, and the main password is stored in iCloud Keychain for secure access.

## Screen

TBD

## Requirement

To run this app, you need the following libraries:

- Swift: 5.10
- Xcode: 15.4 or higher
- KeychainAccess: 4.2.2
- LicenseList: 0.7.0
- WebUI: 2.1.0

## Installation

To install the required libraries listed above, follow these instructions:

### HTTPS

```sh
git clone https://github.com/KaitoMuraoka/PasswordBox
cd PasswordBox
xed .
```

### SSH

```sh
git clone git@github.com:KaitoMuraoka/PasswordBox.git
cd PasswordBox
xed .
```

### GitHub Cli

```sh
gh repo clone KaitoMuraoka/PasswordBox
cd PasswordBox
xed .
```

or Open with Xcode

## License

"Password Box" is licensed under the [MIT license](./LICENSE.txt).
