////////////////////////////////////////////////////////////////////////////
//
// Copyright 2019 MongoDB Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

import RealmSwift
import UIKit

class UserAddress: Object {
  @objc dynamic var street1: String = ""
  @objc dynamic var street2: String = ""
  @objc dynamic var city: String = ""
  @objc dynamic var state: String = ""
  @objc dynamic var postalCode: String = ""
  @objc dynamic var country: String = ""
  
  convenience init(street1: String, street2: String, city: String, state: String, postalCode: String, country: String) {
    self.init()
    self.street1 = street1
    self.street2 = street2
    self.city = city
    self.state = state
    self.postalCode = postalCode
    self.country = country
  }
}

class UserContact: Object {
  @objc dynamic var email: String = ""
  @objc dynamic var address: UserAddress? = UserAddress()
  @objc dynamic var firstName: String = ""
  @objc dynamic var lastName: String = ""
  
  convenience init (firstName: String, lastName: String, email: String, street1: String, street2: String, city: String, state: String, postalCode: String, country: String) {
    self.init()
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.address = UserAddress(street1: street1, street2: street2, city: city, state: state, postalCode: postalCode, country: country)
  }
}

class StoredImage: Object {
  @objc dynamic var itemId: String = UUID().uuidString
  @objc dynamic var userContact: UserContact? = UserContact()
  @objc dynamic var image: Data? = nil
  @objc dynamic var imageLink: String? = nil
  @objc dynamic var timestamp = Date()
  
  convenience init(image: Data?) {
    self.init()
    self.image = image
    // TODO replace with form data
    self.userContact = UserContact(firstName: "Andrew", lastName: "Morgan", email: "andrew.morgan@mongodb.com", street1: "16 Hatfields", street2: "", city: "London", state: "", postalCode: "SE1 8DJ", country: "UK")
  }
  
  override static func primaryKey() -> String? {
      return "itemId"
  }
}