\name{Voter_file}
\alias{Voter_file}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Voter File: state files made simple
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Voter files are notoriously difficult to deal with and do analysis on, and this creates a massive barrier for young computational political science students. This function turns a 2 hour process into a 2 minute one by automating it.
}
\usage{
Voter_file(State, filelocation, filename)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{State}{Describe what state you are working with.
%%     ~~Describe \code{x} here~~
}
  \item{filelocation}{What folder are your files in?}
  \item{filename}{If the voter file is not split up by county, just name the file}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
Tyler Richards ~ @tylerjrichards
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
## Florida <- Voter_file(State = "Florida", filelocation = "~/Documents/Data_Projects/National Voter Data File/Florida/VF")

