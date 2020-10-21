class List inherits A2I {
    item: Object;
    next: List;

    init(i: Object, n: List): List {
        {
            item <- i;
            next <- n;
            self;
        }
    };

    flatten(): String {
        let string: String <-
            case item of
                i: Int => i2a(i);
                s: String => s;
                --- other string converters here
                o: Object => { abort(); ""; };
        if (isvoid next) then
            string
        else
            string.concat(next.flatten())
        fi
    };
}

class Main inherits IO {
    main(): Object {
        let hello: String <- "Hello, ",
            word: String <- "World!",
            i: Int <- 11,
            newline: String <- "\n",
            nil: List,
            list: List <- (new List).init(hello,
                              (new List).init(word,
                                  (new List).init(i,
                                      (new List).init(newline, nil))))
        in
            -- out_string(hello.concat(word.concat(newline)))
            out_string(list.flatten())
    };
}
