# 20G - Flappy Bird

Flappy bird was a mobile game from 2013. 
It was a sleeper hit, gaining sudden and massive popularity in 2014, 
likely due to attention from a popular YouTuber at that time. 
The game was removed from the App store after it’s sudden popularity due to negative media attention.

The game is extremely simple, and was designed to mimic the feeling of bouncing a ping pong ball on a paddle for as long as possible.

## Difficulty

* Complexity: ⭐
* Scope: ⭐

## Goals:

* Create a game world with a floor.
* Add an object that represents the main character. Apply a constant force to the character so it falls to the floor.
* Add obstacles on the right of the game area. The obstacles should slide across the screen toward the left. The obstacles will appear in pairs, with a vertical gap between them.
* Detect when the character collides with the floor or obstacles, and reset the game when a collision occurs.
* Accumulate one point for each obstacle that the player passes. Display the score.

## Stretch Goals:

* Add some sounds that will play each time the player gains a point, and when the player loses.
* Add a basic game-over screen to display the player’s score.
* Track the high-score between play sessions and display the high score alongside the current score.
* Add some background art! Try layering the background and scrolling at a different rate to the foreground obstacles. This is called Parallax scrolling.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## Author

[David Urbina](https://github.com/Diomeh)

## Conventions

This project follws both the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#summary)
and [Semantic Versioning](https://semver.org/) specifications.

Semantic versioning is ensured by leveraging conventional commits.

The commit message should be structured as follows:

```plaintext
{type}[optional scope]: {description}

[optional body]

[optional footer(s)]
```

Where `type` is one of the following:

| Type              | Description                                                                                             | Example Commit Message                            |
| ----------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| `fix`             | Patches a bug in your codebase (correlates with PATCH in Semantic Versioning)                           | `fix: correct typo in README`                     |
| `feat`            | Introduces a new feature to the codebase (correlates with MINOR in Semantic Versioning)                 | `feat: add new user login functionality`          |
| `BREAKING CHANGE` | Introduces a breaking API change (correlates with MAJOR in Semantic Versioning)                         | `feat!: drop support for Node 8`                  |
| `build`           | Changes that affect the build system or external dependencies                                           | `build: update dependency version`                |
| `chore`           | Other changes that don't modify src or test files                                                       | `chore: update package.json scripts`              |
| `ci`              | Changes to CI configuration files and scripts                                                           | `ci: add CircleCI config`                         |
| `docs`            | Documentation only changes                                                                              | `docs: update API documentation`                  |
| `style`           | Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc.) | `style: fix linting errors`                       |
| `refactor`        | Code change that neither fixes a bug nor adds a feature                                                 | `refactor: rename variable for clarity`           |
| `perf`            | Code change that improves performance                                                                   | `perf: reduce size of image files`                |
| `test`            | Adding missing tests or correcting existing tests                                                       | `test: add unit tests for new feature`            |
| Custom Types      | Any other type defined by the project for its specific needs                                            | `security: address vulnerability in dependencies` |

For more information, refer to the [Conventional Commits Specification](https://www.conventionalcommits.org/en/v1.0.0/).
