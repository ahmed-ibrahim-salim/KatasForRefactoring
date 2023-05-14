@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func testFoo() throws {
        let items = [Item(name: "foo", sellIn: 4, quality: 40)]
        let app = GildedRose(items: items)
        app.updateQuality()
        
        XCTAssertEqual(3,  items[0].sellIn)
        XCTAssertEqual(39,  items[0].quality)
        
        XCTAssertEqual(app.items[0].name, "foo")
    }
}
