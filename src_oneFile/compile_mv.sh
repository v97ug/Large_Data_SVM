ghc --make Main
rm *.hi
rm *.o
mv Main MainOneFile
mv MainOneFile ..
