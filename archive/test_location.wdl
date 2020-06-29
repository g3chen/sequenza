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
        docker: "g3chen/sequenza@sha256:f6ebd82705ecc3bdf5f2fead408333ae60492f36b23259d0730d6c70fc7fbb00"
        modules: "sequenza/2.1.2 sequenza-scripts/2.1.2 sequenza-res/2.1.2"
    }
}
