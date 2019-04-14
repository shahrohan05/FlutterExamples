
List HeroItems = [
  HeroItem(name: 'Iron Man',image: 'images/icons8-iron-man-48.png'),
  HeroItem(name: 'Hulk',image: 'images/icons8-hulk-48.png'),
  HeroItem(name: 'Wolverine',image: 'images/icons8-logan-x-men-48.png'),
  HeroItem(name: 'Groot',image: 'images/icons8-groot-48.png'),
  HeroItem(name: 'Batman',image: 'images/icons8-batman-48.png'),
  HeroItem(name: 'Cat Woman',image: 'images/icons8-catwoman-48.png'),
  HeroItem(name: 'Deadpool',image: 'images/icons8-deadpool-48.png'),
  HeroItem(name: 'Green Arrow',image: 'images/icons8-green-arrow-dc-48.png'),
  HeroItem(name: 'Green Lantern',image: 'images/icons8-green-lantern-dc-48.png'),
  HeroItem(name: 'Hawk Girl',image: 'images/icons8-hawkgirl-48.png'),  
  HeroItem(name: 'Thanos',image: 'images/icons8-infinity-gauntlet-filled-50.png'),
  HeroItem(name: 'Professor X',image: 'images/icons8-professor-x-48.png'),
  HeroItem(name: 'Rogue',image: 'images/icons8-rogue-48.png'),
  HeroItem(name: 'Spider Man',image: 'images/icons8-spider-man-head-48.png'),
  HeroItem(name: 'Wonder Woman',image: 'images/icons8-wonder-woman-48.png'),
];


class HeroItem {
  HeroItem({this.image,this.name});
  
  final String image;
  final String name;

  @override
  bool operator ==(other) => other is HeroItem && other.name == this.name;

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() => name;
}