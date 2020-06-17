workflow test_location {
    call find_tools
}

task find_tools {
    command {
        whereis sequenza
        echo "@@@@@@@@@@@@@@@@"
        whereis R
        echo "@@@@@@@@@@@@@@@@"
        whereis bioconductor
        echo "@@@@@@@@@@@@@@@@"
        whereis sequenza-scripts
        echo "@@@@@@@@@@@@@@@@"
        whereis sequenza-res
        echo "@@@@@@@@@@@@@@@@"


        echo $MANPATH
        echo "################"
        echo $PATH
        echo "################"
        echo $LD_LIBRARY_PATH
        echo "################"
        ls $JAVA_ROOT
        echo "################"
        ls $PICARD_ROOT
    }
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/sequenza:1.0"
    }
}
