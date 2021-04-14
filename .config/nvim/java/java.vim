"" Stream Classes and Interfaces
" Streams
syntax keyword javaStreamClass BaseStream DoubleStream IntStream LongStream Stream StreamSupport
" Stream Builders
syntax keyword javaStreamClass DoubleStream.Builder IntStream.Builder LongStream.Builder Stream.Builder
" Collectors
syntax keyword javaStreamClass Collector Collector.Characteristics Collectors
highlight javaStreamClass guifg=#f0c948
"syntax keyword javaStreamMethod stream allMatch anyMatch builder collect concat count distinct dropWhile empty filter findAny findFirst flatMap flatMapToDouble flatMapToInt flatMapToLong forEach forEachOrdered generate iterate limit map mapToDouble mapToInt mapToLong max min noneMatch of ofNullable peek reduce skip sorted takeWhile toArray
"highlight javaStreamMethod guifg=#e0b938


let b:current_syntax = "java.vim"
