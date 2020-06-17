workflow test_location {
    call find_tools
}

task find_tools {
    command {
        ls $BIOCONDUCTOR_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $RSTATS_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $SEQUENZA_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $SEQUENZA_RES_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $SEQUENZA_SCRIPTS_ROOT
        echo "@@@@@@@@@@@@@@@@"

        echo $PATH
        echo "################"
        echo $MANPATH
        echo "################"
        echo $LD_LIBRARY_PATH
        echo "################"
        echo $R_LIBS_SITE
    }
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/sequenza:1.0"
    }
}
