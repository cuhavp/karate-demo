Feature: multi set

  Scenario: set via table where variable dose not exist note how to karate will create parent path if needed
    * set foo
      | path | value    |
      | bar  | 'bar'    |
      | a.b  | 'c'      |
      | fizz | {d: 'e'} |

    * match foo == {bar : 'bar', a :{b: 'c'}, fizz: {d: 'e'}}

  Scenario: set via table with fancy array paths and multi-dimensional arrays
    * set foo
      | path   | value  |
      | bar[0] | 'baz'  |
      | a[0].b | 'ban'  |
      | c[0]   | [1, 2] |
      | c[1]   | [3, 4] |

    * match foo == { bar: [ 'baz'], a: [{ b: 'ban' }], c: [[1, 2], [3, 4]] }

  Scenario: set via table, and blanks are skipped
    * set search
      | path       | 0       | 1      | 2       |
      | name.first | 'John'  | 'Jane' |         |
      | name.last  | 'Smith' | 'Doe'  | 'Waldo' |
      | age        | 20      |        |         |

    * match search[0] == { name: { first: 'John', last: 'Smith' }, age: 20 }
    * match search[1] == { name: { first: 'Jane', last: 'Doe' } }
    * match search[2] == { name: { last: 'Waldo' } }

