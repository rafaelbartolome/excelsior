# Excelsior
### Just playing with Marvel Open API in a demo project.

The idea behind this project is to develop an iOS app with an scalable architecture , puting into pracctice several design patterns.

Due to that, some parts are quite over-engienered as the main goal is to design a solid architecture, this code is not production ready.

[![Twitter](https://img.shields.io/badge/main_contributor-Rafael%20Bartolome-orange)](http://twitter.com/rafaelbartolome)
[![Swift](https://img.shields.io/badge/swift-5.2-green)](https://swift.org)
[![License](https://img.shields.io/github/license/rafaelbartolome/excelsior)](LICENSE)

## 💬 Description 

### Disclaimer

Talking about architectures is quite hard as everibody has a preferred one, normaly the one that works better for solving a specific problem.

Please, be open minded with this repo. The idea is to develop several patterns that has solved problems in projects I worked on over the last years.

The main objetive is not to develop a **perfect** architecture (That's not a real thing) but to try to solve a common problem, make a scalable architecture, divided in several independent frameworks in order to allow the colavoration of a **big** number of developers in a **huge** project with as many conflicts as possible.

### Vertical vs horizontal frameworks

**Horizontal frameworks** are great for base layers to be used by several teams. Problem is that it's easy to generate conflicts as everybody needs to touch common code all time to develop a new feature.

![Horizontal frameworks](Doc/horizontal-fmw.png)

**Vertical frameworks** are great to avoid conflics between several teams, as one team only needs to modify (or create) a framework for a functionality. Problem is that part of the code will be repeated (ex: the part that control network events) or diseminated in several parts.

![Vertical frameworks](Doc/vertical-fmw.png)

**Mixed approach**, why not having the best from both worlds? Well, that's complicated. Creating a mixed approach with horizontal frameworks for common code parts and vertical features has a lot of challenges but it looks as the best approach for big applications.
Main challenge is to define the boundaries of each framework and define how is responsable of maintain the common parts.

![Vertical frameworks](Doc/mixed-fmw.png)

### Frameworks architecture

TODO: Describe final architecture

### FEatures internal architecture

TODO: describe internal arch



TODO: 
API Client Moya, Moya’s approach doesn’t scale with medium to big teams. You end up with a single [big enum type](https://github.com/Moya/Moya/blob/master/docs/Examples/Basic.md) that contains lots of details. Merge conflicts within that file will certainly arise, and generally, the end file will be hard to process. The "open/close" principle of SOLID is broken.



## 📌 Features 

- [x] List of Marvel characters.
- [x] Detail of a specific character.

## ⚙️ Requirements

- Xcode >= 11.3

## 🔍 References

- **[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)** - "The clean cloder blog" [Robert C. Martin (Uncle Bob)](https://twitter.com/unclebobmartin)

- **[Viper](https://www.objc.io/issues/13-architecture/viper/)** - "Architecting iOS Apps with VIPER" By [Jeff Gilbert](jeff.gilbert@mutualmobile.com) and [Conrad Stoll](https://twitter.com/conradstoll)

- **[Repository Pattern](https://martinfowler.com/eaaCatalog/repository.html)** - "Catalog of Patterns of Enterprise Application Architecture" by Edward Hieatt and Rob Mee

- **[API Client](https://medium.com/makingtuenti/writing-a-scalable-api-client-in-swift-4-b3c6f7f3f3fb)** - "Writing a Scalable API Client in Swift 5"  [Victor Pimentel](https://medium.com/@VictorPimentel)

- **[Navigation](https://jobandtalent.engineering/the-navigator-420b24fc57da)** - "Another twist to iOS navigations" [Ruben Mendez](https://jobandtalent.engineering/@ruben.mendez)

- **[Dependency Injection](https://www.vadimbulavin.com/dependency-injection-in-swift/)** - "Advanced Dependency Injection on iOS with Swift 5" by [Vadim Bulavin](https://www.vadimbulavin.com)

## 🍔 Author

- Rafael Bartolomé – [@rafaelbartolome](https://twitter.com/rafaelbartolome) – rafa@rafaelbartolome.es

## 📄 License

Excelsior is available under the MIT license. See ``LICENSE`` file for more information.