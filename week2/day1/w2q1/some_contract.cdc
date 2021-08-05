access(all) contract SomeContract {
    pub var testStruct: SomeStruct

    pub struct SomeStruct {
        // 4 Variables
        //
        pub(set) var a: String

        pub var b: String

        access(contract) var c: String

        access(self) var d: String

        // 3 Functions
        //
        pub fun publicFunc() {}


        access(self) fun privateFunc() {}
        

        access(contract) fun contractFunc() {}


        pub fun structFunc() {
            // Area 1
            // Variables that can be read: a, b, c, d, e (e needs to creat resource first)
             self.a
              self.b
              self.c
              self.d      
                      
            // Variables that can be modified: a, b, c and d.
             self.a="a"
              self.b="a"
              self.c="c"
              self.d="d"
            // Functions that can be accessed: publicFunc, questsAreFun, privateFunc and contractFunc,createSomeResource.
             self.publicFunc()
             SomeContract.questsAreFun()
             self.privateFunc() 
             self.contractFunc()
              let   rs <- SomeContract.createSomeResource()
              rs.e
           destroy rs
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    pub resource SomeResource {
        pub var e: Int

        pub fun resourceFunc() {
            // Area 2
            // Variables that can be read: a, b, c, e
          let testStruct=SomeContract.SomeStruct()
              testStruct.a
              testStruct.b
              testStruct.c
            self.e 
            // Variables that can be modified: a, e
              testStruct.a="a"
               self.e =16
            // Functions that can be accessed: publicFunc,questsAreFun and contractFunc,createSomeResource .
            testStruct.publicFunc()
            testStruct.contractFunc()
            SomeContract.questsAreFun()
           let   rs <- SomeContract.createSomeResource()
           rs.e
           destroy rs
        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
        // Area 3
        // Variables that can be read: a, b, c, e
           let testStruct=SomeContract.SomeStruct()
              testStruct.a
              testStruct.b
              testStruct.c
             let   rs <- SomeContract.createSomeResource()
           rs.e
             destroy rs
        // Variables that can be modified: a
        testStruct.a="a"
        testStruct.publicFunc()
            testStruct.contractFunc()
            self.questsAreFun()
       
        // Functions that can be accessed: publicFunc, structFunc(), and contractFunc,createSomeResource, questsAreFun.
    }

    init() {
        self.testStruct = SomeStruct()
    }
}
