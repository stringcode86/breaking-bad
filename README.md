#  Breaking bad demo notes

## Architecture

- I went with VIPER (iOS version of clean architecture). As it is industry standard for larger sized teams. It allows for modularity, easy testing and dependency injections.
- Bootstrapping wise I am using simple service directory. In real production environment I would go for something more robust like swinject.

## Other notable stuff
- I implemented a simple image cache that downloads images on the `OperationQueue` and saves them to `~/tmp`. As well as `UIImageExtension` that takes advantage of it. Operations are canceled when cell becomes invisible,so scrolling any number of cells would not be an issue.
- Storyboard use. I implement whole thing in an extreme hurry. This was the quickest path. In production that may not be the best choice.
- Season switcher UI. I basically had 5 min left to implement it. Ideally I would like to use pop over with its own module.

## Testing
- Given the choice of architecture, it would be easy and convenient to implement unit and functional tests. Using something like EarlGrey or Gurken. I only had less then 2 hours to get this done. I simply ran out of time. 



