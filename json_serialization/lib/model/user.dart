class User {
  int id;
  String name;
  int mobile;
  String address;
  String email;

  User(this.id,this.name,this.mobile,this.address,this.email);

  
  User.fromJSON(Map<String, dynamic> userdata) 
  :id = userdata['id'],
   name = userdata['name'],
   mobile = userdata['mobile'],
   address = userdata['address'],
   email = userdata['email'] {

  }

  Map<String, dynamic> toJSON() =>
    {
      'id' : id,
      'name' : name,
      'mobile' : mobile,
      'address' : address,
      'email' : email
    };

  @override
  String toString() {
    return '[id : $id, name : $name, mobile : $mobile, address : $address email : $email]';
  }


}