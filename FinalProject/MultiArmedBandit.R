utils.assert <- function(fact, proposition) {
    if (proposition == FALSE) {
        cat("Proposition is not satisfied \n")
        cat(" Invaild proposition : '", fact, "' \n", sep="")
        stopifnot(proposition)
    }
}

utils.zeros <- function(cnt) {
    utils.assert("", cnt>=1)
    return (rep(0, cnt))
}

utils.normalization <- function(array, range=c(0,1)) {
    size <- length(array)
    norm <- utils.zeros(size)
    min <- min(array)
    max <- max(array)

    for (i in c(1:size)) {
        norm[i] = (max(range) - min(range)) * ((array[i] - min) / (max - min)) + min(range)
    }

    return (norm)
}

utils.generate_slot_machines <- function(cnt, seed=NULL) {
    utils.assert("", cnt>=1)
    if (is.numeric(seed)) {
        set.seed(seed)
    }

    gen <- rnorm(cnt, 0.0, 5.0)

    return (utils.normalization(gen, range=c(0, 1)))
}

utils.get_pdf <- function(array) {
    size <- length(array)
    pdf <- utils.zeros(size)
    for (i in c(1:size)) {
        if (i != 1) {
            pdf[i] <- pdf[i-1]
        }
        pdf[i] <- pdf[i] + array[i]
    }
    return (pdf)
}

utils.pdf2avg <- function(array) {
    size <- length(array)
    avg <- utils.zeros(size)
    for (i in c(1:sample_times)) {
        avg[i] <- array[i] / i
    }
    return (avg)
}

utils.get_maxindex <- function(array) {
    size <- length(array)
    idx <- 1
    max <- array[idx]
    for (i in c(1:size)) {
        if (max < array[i]) {
            idx <- i
            max <- array[idx]
        }
    }
    return (idx)
}

utils.get_benefit <- function(rate) {
    x <- runif(1, 0.0, 1.0)
    benefit <- 0
    if (rate > x) {
        benefit <- 1
    }
    return (benefit)
}

# global allocation
number <- 80
slot_machines <- utils.generate_slot_machines(number)
sample_times <- 20000
barplot(height=slot_machines,
        width=1,
        names.arg=c(1:number),
        xlab="Number", ylab="Benefit Rate",
        ylim=c(0,1),
        main="Benefit for different multi-armed bandit")


# random sample
random_sample <- function(dump=TRUE) {
    random_choice <- sample(1:number, sample_times, replace=TRUE)
    benefit <- utils.zeros(sample_times)
    record_benefit <- utils.zeros(number)
    record_cnt <- utils.zeros(number)

    for (i in c(1:sample_times)) {
        choice <- random_choice[i]
        rate <- slot_machines[choice]
        benefit[i] = utils.get_benefit(rate)

        record_benefit[choice] = record_benefit[choice] + benefit[i]
        record_cnt[choice] = record_cnt[choice] + 1
    }

    benefit_pdf <- utils.get_pdf(benefit)
    benefit_avg <- utils.pdf2avg(benefit_pdf)

    if (dump) {
        plot(x=c(1:sample_times), y=benefit_avg,
             xlab="Sample Times", ylab="Average Benefit",
             pch = 16, cex = 0.2,
             ylim=c(0,1), main="Random sample")

        cat("Average Benefit :", benefit_avg[sample_times], "\n")
    }
    return (benefit_avg)
}

# ϵ-greedy
greedy_selection <- function(epsilon, dump=TRUE) {
    benefit <- utils.zeros(sample_times)
    record_benefit <- utils.zeros(number)
    record_cnt <- utils.zeros(number)

    for (i in c(1:sample_times)) {
        x <- runif(1, 0.0, 1.0)
        if (x < epsilon) {
            # Random choice
            random_choice <- sample(1:number, 1, replace=TRUE)
            rate <- slot_machines[random_choice]
            benefit[i] <- utils.get_benefit(rate)
            record_benefit[random_choice] <- record_benefit[random_choice] + benefit[i]
            record_cnt[random_choice] <- record_cnt[random_choice] + 1
        } else {
            # Greedy choice
            record_benefit_avg <- utils.zeros(number)
 
            for (idx in c(1:number)) {
                if (record_cnt[idx] > 0) {
                    record_benefit_avg[idx] <- record_benefit[idx] / record_cnt[idx]
                }
            }
        
            index <- utils.get_maxindex(record_benefit_avg)
            rate <- slot_machines[index]
            benefit[i] <- utils.get_benefit(rate)
            record_benefit[index] <- record_benefit[index] + benefit[i]
            record_cnt[index] <- record_cnt[index] + 1
        }
    }

    benefit_pdf <- utils.get_pdf(benefit)
    benefit_avg <- utils.pdf2avg(benefit_pdf)

     if (dump) {
        plot(x=c(1:sample_times), y=benefit_avg,
             xlab="Sample Times", ylab="Average Benefit",
             pch = 16, cex = 0.2,
             ylim=c(0,1), main=paste("Greedy Selection : epsilon", epsilon))

        cat("Average Benefit :", benefit_avg[sample_times], "\n")
    }
    return (benefit_avg)
}

# Upper Confidence Bound
utils.ucb_select <- function(q_table, prop, exploration) {
    size = length(q_table)
    utils.assert("", size == length(prop))
    tot = sum(prop) + 1
    UCBs <- utils.zeros(size)
    for (i in c(1:size)) {
        UCBs[i] <- q_table[i] + exploration * sqrt(log(tot, base=exp(1))/(prop[i] + 1))
    }
    return (utils.get_maxindex(UCBs))
}

upper_confidence_bound  <- function(exploration, dump=TRUE) {
    benefit <- utils.zeros(sample_times)
    record_benefit <- utils.zeros(number)
    record_cnt <- utils.zeros(number)

    for (i in c(1:sample_times)) {
        record_benefit_avg <- utils.zeros(number)
        for (idx in c(1:number)) {
            if (record_cnt[idx] > 0) {
                record_benefit_avg[idx] <- record_benefit[idx] / record_cnt[idx]
            } else {
                record_benefit_avg[idx] = 0.5
            }
        }
        index <- utils.ucb_select(record_benefit_avg, record_cnt, exploration)
        rate <- slot_machines[index]
        benefit[i] <- utils.get_benefit(rate)
        record_benefit[index] <- record_benefit[index] + benefit[i]
        record_cnt[index] <- record_cnt[index] + 1
    }

    benefit_pdf <- utils.get_pdf(benefit)
    benefit_avg <- utils.pdf2avg(benefit_pdf)

    if (dump) {
        plot(x=c(1:sample_times), y=benefit_avg,
             xlab="Sample Times", ylab="Average Benefit",
             pch = 16, cex = 0.2,
             ylim=c(0,1), main=paste("Upper Confidence Bound : exploration", exploration))

        cat("Average Benefit :", benefit_avg[sample_times], "\n")
    }
    return (benefit_avg)
}

# Upper Confidence Bound Improve
utils.ucb_improve_select <- function(q_table, prop, exploration, base) {
    size = length(q_table)
    utils.assert("", size == length(prop))
    tot = sum(prop) + 1
    UCBs <- utils.zeros(size)
    for (i in c(1:size)) {
        UCBs[i] <- q_table[i] + (exploration - log((base + tot)/base)) * sqrt(log(tot, base=exp(1))/(prop[i] + 1))
    }
    return (utils.get_maxindex(UCBs))
}

upper_confidence_bound_improve  <- function(exploration, base, dump=TRUE) {
    benefit <- utils.zeros(sample_times)
    record_benefit <- utils.zeros(number)
    record_cnt <- utils.zeros(number)

    for (i in c(1:sample_times)) {
        record_benefit_avg <- utils.zeros(number)
        for (idx in c(1:number)) {
            if (record_cnt[idx] > 0) {
                record_benefit_avg[idx] <- record_benefit[idx] / record_cnt[idx]
            } else {
                record_benefit_avg[idx] = 0.5
            }
        }
        index <- utils.ucb_improve_select(record_benefit_avg, record_cnt, exploration, base)
        rate <- slot_machines[index]
        benefit[i] <- utils.get_benefit(rate)
        record_benefit[index] <- record_benefit[index] + benefit[i]
        record_cnt[index] <- record_cnt[index] + 1
    }

    benefit_pdf <- utils.get_pdf(benefit)
    benefit_avg <- utils.pdf2avg(benefit_pdf)

    if (dump) {
        plot(x=c(1:sample_times), y=benefit_avg,
             xlab="Sample Times", ylab="Average Benefit",
             pch = 16, cex = 0.2,
             ylim=c(0,1), main=paste("Upper Confidence Bound Improve : exploration", exploration))

        cat("Average Benefit :", benefit_avg[sample_times], "\n")
    }
    return (benefit_avg)
}

random_benefit_avg <- random_sample()
greedy_benefit_avg <- greedy_selection(0.1)
ucb_benefit_avg_1 <- upper_confidence_bound(1.414)
ucb_benefit_avg_2 <- upper_confidence_bound(0.5)
ucbi_benefit_avg_1 <- upper_confidence_bound_improve(1.414, 5000)
ucbi_benefit_avg_2 <- upper_confidence_bound_improve(0.5, 5000)

plot(x=c(1:sample_times), y=random_benefit_avg,
     xlab="Time Step", ylab="Average Benefit",
     pch = 16, cex = 0.2, col=1,
     ylim=c(0,1.2),
     main="Benefit of multi-armed bandit")
points(x=c(1:sample_times), y=greedy_benefit_avg,
       pch = 16, cex = 0.2, col=2)
points(x=c(1:sample_times), y=ucb_benefit_avg_1,
       pch = 16, cex = 0.2, col=3)
points(x=c(1:sample_times), y=ucb_benefit_avg_2,
       pch = 16, cex = 0.2, col=4)
points(x=c(1:sample_times), y=ucbi_benefit_avg_1,
       pch = 16, cex = 0.2, col=5)
points(x=c(1:sample_times), y=ucbi_benefit_avg_2,
       pch = 16, cex = 0.2, col=6)
legend("topright", legend=c("random","greedy-0.1","UCB-1.414","UCB-0.5","UCBI-1.414","UCBI-0.5"),
       col=c(1:6), ncol=3, pch=1)
