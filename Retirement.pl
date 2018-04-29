#Perl - Retirement Savings Goal
#Michael Kruger
$year = 2014; #Default Year
$retireYear = 0; #Accumulating Balance PER Year
$accruedInterest = 0; #Interest PER Year
$newBalance = 0; #New starting balance PER Year

print "Please enter the starting amount for your retirement account: ";
$retireAmount = <>; #User input for Retirement Account
chomp $retireAmount;

print "Please enter your age: ";
$age = <>; #User input for current age
chomp $age;

print "At what age are you planning to retire?: ";
$retireAge = <>; #User input for retirement age
chomp $retireAge;

print "Please enter an amount of money to be deposited each year: ";
$fixedAmount = <>; #Amount per year to be deposited
chomp $fixedAmount;

print "What is the expected Annual Return Rate you are expecting?: ";
$ARR = <>; #User input for expected Annual Return Rate
chomp $ARR;
if ($ARR > 1){ #Checks to make sure calculations are made in percentages
    $ARR = $ARR/100;
    }

print "How much money would you like to have when you retire at $retireAge?: ";
$endAmount = <>; #Amount of money in the account when retired
chomp $endAmount;
     
print "\nCurrent Year: $year\n";
print "Starting Balance: $retireAmount\n";
print "Year:\t\tBalance:\t\tInterest Accrued:\t\tNew Balance:\n";

$time = $retireAge - $age; #Amount of time in years until retirement
$newBalance = $retireAmount;
$accruedInterest = $newBalance * $ARR;
$retireYear = $newBalance + $accruedInterest;

for ($i = 0; $i < $time; $i++){ #Begin table creation and formatting, "printf" used to format decimals       
        if ($i+1 != $time){ #Ensures balances aren't updated after the last year is displayed
          print ($year + ($i+1));
          print "\t\t";
          printf "%.2f", $newBalance; 
          print "\t\t\t";
          printf "%.2f", $accruedInterest;
          print "\t\t\t";
          printf "%.2f", $retireYear;
          print "\n";
          #Updating Balances for new year only if required
          $newBalance = $retireYear + $fixedAmount;
          $accruedInterest = $newBalance * $ARR;
          $retireYear = $accruedInterest + $newBalance;
        }
        else{ #Displays only if final year has been reached, formats final totals
            print "\n";
            print ($year + ($i+1));
            print "\t\t";
            printf "%.2f", $newBalance;
            print "\t\t\t";
            printf "%.2f", $accruedInterest;
            print "\t\t\t";
            printf "%.2f", $retireYear;
            print "\n";
          }
    }
if ($retireYear < $endAmount){ #Checks to see if the retirement goal was reached
    print "\nYou currently have ";
    printf "%.2f", $retireYear;
    print " and are in need of ";
    printf "%.2f", ($endAmount-$retireYear);
    print " more to reach your goal of $endAmount in order to retire at $retireAge";
    
    #"Countdown" until mocking commences
    $countdown = 6; #Determines how long "sleep" functions lasts and start of "Countdown"
    while($countdown--){
            print "\n$countdown", "....";
            sleep(1);
        }
    
    print "\nBOOM! You will be sad AND poor when you're old! Plan better next time!";
    print "\nRetirement is no laughing matter!";
    }
else { #Prints only if retirement goal was reached and success was achieved!
        print "\nCongrats!  You have made it to retirement!!!";
        if ($retireYear > $endAmount){ #Incase of RESOUNDING success...
                print "\n\nWoah!!!  You surpassed your retirement goal by ";
                printf "%.2f", ($retireYear - $endAmount);
                print "!!!!!\nMost impressive!  You must be a retirement saving MASTER!!!";
                print "\n\nSee you next retirement!";
            }
     }
<>;
