
! rm -r "/home/jed/Documents/LPA/Library"
cd "/home/jed/Documents/LPA"
! git clone https://github.com/jimb0w/Library.git

*copy "http://www.stata-journal.com/production/sjlatex/stata.sty" stata.sty

texdoc init LPA, replace logdir(LPA_log) gropts(optargs(width=0.8\textwidth))
set linesize 100

/***

\documentclass[11pt]{article}
\usepackage{fullpage}
\usepackage{siunitx}
\usepackage{hyperref,graphicx,booktabs,dcolumn}
\usepackage{stata}
\usepackage[x11names]{xcolor}
\usepackage{natbib}
\usepackage{chngcntr}
\usepackage{pgfplotstable}
\usepackage{pdflscape}
\usepackage{amssymb}
\usepackage{multirow}
\usepackage{booktabs}
\usepackage[section]{placeins}

\newcommand{\specialcell}[2][c]{%
  \begin{tabular}[#1]{@{}l@{}}#2\end{tabular}}

\newcommand{\specialcelr}[2][c]{%
  \begin{tabular}[#1]{@{}r@{}}#2\end{tabular}}

\newcommand{\thedate}{\today}

\counterwithin{figure}{section}
\counterwithin{table}{section}

\bibliographystyle{unsrt}
\renewcommand{\bibsection}{}
\makeatletter
\renewcommand\@biblabel[1]{	#1.}
\makeatother

\begin{document}

\begin{titlepage}
    \begin{flushright}
        \Huge
        \textbf{
Population testing for Lipoprotein(a): Health economic analyses
}
\color{black}
\rule{16cm}{2mm} \\
\Large
\color{black}
Protocol \\
\thedate \\
\color{blue}
https://github.com/jimb0w/LPA \\
\color{black}
       \vfill
    \end{flushright}
        \Large

\noindent
Jedidiah Morton \\
Research Fellow \\
\color{blue}
\href{mailto:Jedidiah.Morton@Monash.edu}{Jedidiah.Morton@monash.edu} \\ 
\color{black}
Monash University, Melbourne, Australia \\\
\end{titlepage}

\pagebreak
\tableofcontents
\pagebreak

\pagebreak
\section{Introduction}

Lipoprotein(a) (Lp(a)) is an important risk factor for cardiovascular disease (CVD) 
in a subset of the population with high Lp(a)
\cite{LaminaJAMAC2019,LarssonCirc2020,WelshEJPC2021}. 
Depending on the cut-off used to define ``high'' Lp(a), anywhere from $\sim$10-20\% of individuals
may have high Lp(a) \cite{WelshEJPC2021,NordEHJ2010}.
However, it is not currently routinely measured in clinical practice \cite{NordEHJ2010}, meaning most individuals
with high Lp(a) are unaware of this status and, consequently, do not modify their CVD risk or 
have their CVD risk modified by a clinician. 

While there are currently no available options for treating high Lp(a) itself (beyond apheresis),
it can still be useful to reclassify risk and prompt more intensive management
of other cardiovascular risk factors that might otherwise go untreated. Moreover, 
highly effective treatments to lower Lp(a) are in a late stage of development \cite{ODONEJM2022,NissenJAMA2023},
and should be available soon. 

Thus, widespread Lp(a) testing could be a useful way to improve the prevention of CVD
in the population. Indeed, it is fully 
expressed by the first year of life \cite{WangPed1992,RifaiAth1992,McNealJCL2015}, 
and it is largely genetically determined \cite{BoerJCI1992} (although genetic testing is not required),
meaning it will generally only need to be measured once in a lifetime in most people. 
Moreover, the test cost is relatively cheap (depending on the jurisdiction, ranging from a few dollars to approximately US\$50).

However, to date, no studies have evaluated the cost-effectiveness of widespread Lp(a) testing. 
Therefore, herein, we will construct a state-of-the-art health economic model that simulates the primary and secondary prevention of CVD
to perform two health economic analyses. 
First, we will evaluate the cost-effectiveness of testing for Lp(a) in the primary prevention population, where testing is followed
by treatment of other cardiovascular risk factors, compared to current practice. 
Second, we will evaluate the cost-effectiveness of testing for Lp(a) in both the primary and secondary prevention populations, 
where testing is followed by treatment for Lp(a) directly, 
compared to current practice. 

\clearpage
\section{Population, intervention, and control}

\subsection{Study 1: Lp(a) testing and treatment of other risk factors}
\label{s1sec}

The population for this study will be the primary prevention population initially aged between 40 and 69 years,
followed up until age 85 years (i.e., this study will use a lifetime horizon). People aged 70 and above are excluded
because they are almost always at high risk and thus warrant treatment \cite{VisserenEHJ2021}, meaning testing
for Lp(a) with the goal of modifying traditional risk factors would not be appropriate. Conversely, people aged
below 40 years are rarely recommended for pharmacological treatment \cite{VisserenEHJ2021} and were thus also excluded.  
We have deliberately not specified a country as this analysis will be repeated from the perspective of multiple countries.

The control scenario will be based on current standard of care using European guidelines on CVD prevention \cite{VisserenEHJ2021}.
These guidelines are, by design, ambiguous and thus do not provide specific treatment recommendations
for individuals as they encourage personalising recommendations. For example, the guidelines state:
``Across the entire range of CVD risk, the decision to initiate interventions remains a matter of individual
consideration and shared decision-making.''
Therefore, in this analysis, the control scenario will be broadly based
on the guidelines, but recommendations of these guidelines will
be oversimplified to the following (also outlined in Figure~\ref{Control_schematic}:

\begin{enumerate}
\item All individuals with diabetes receive both a high intensity statin and 
pharmacological treatment for hypertension if they have a systolic blood pressure (SBP) of $\geq$140 mmHg.
\item All individuals without diabetes aged 40 and above will be tested for CVD risk every 5 years
using the updated Systemic Coronary Risk Estimation (SCORE2) algorithm
\cite{SCORE2}. 
\item Individuals deemed ``Very high risk'' from SCORE2
will be treated with a high intensity statin (regardless of baseline low-density lipoprotein-cholesterol (LDL-C); 
statins reduce CVD risk regardless of baseline LDL-C levels \cite{CTTLancet2005})
and will receive pharmacological anti-hypertensive treatment if they have an SBP of $\geq$140 mmHg.
In the European guidelines, ``Very high risk'' thresholds are $\geq$7.5\% for individuals 
aged $<$50 years and $\geq$10\% for individuals aged 50-69 years. 
\item Individuals deemed `High risk'' or lower will not be pharmacologically treated unless
they have an LDL-C level of $\geq$5.0 mmol/L or a 
SBP of $\geq$160 mmHg.
\item Individuals become ``Very high risk'' once they reach age 70 years and receive both a high intensity statin and 
pharmacological treatment for hypertension if they have a systolic blood pressure (SBP) of $\geq$140 mmHg.
\end{enumerate}

The high intensity statin in this study will be atorvastatin 80 mg, 
leading to a mean reduction in LDL-C of 51.7\% (51.2, 52.2) \cite{AdamsCDSR2015}.
This figure was derived from a systematic review
and meta-analysis of randomised clinical trials. 

Pharmacological therapy for lowering SBP will be based on the SPRINT trial \cite{SPRINT2015},
because it is the main trial cited when recommending pharmacological SBP lowering in the European guidelines \cite{VisserenEHJ2021}.
In the intensive SBP control arm of this trial, it took a mean of 2.8 medications to achieve an approximately
20 mmHg reduction in SBP. We will base the intervention on the most common medications used in the intensive arm --
losartan 100 mg, chlortalidone 25 mg, and amlodipine 10 mg and assume they lead to a 20 mmHg ($\pm$25\%) reduction in SBP. 

This is obviously a \emph{gross} oversimplification of clinical practice. But it is simply 
impossible to capture the nuances of clinical practice in a population of this size and in such an 
ambiguous area as primary prevention of CVD. We think this will be a reasonable approximation of
current practice for CVD and, thus, a fair comparator for the implementation of an Lp(a) testing study. 

The intervention scenario will be as above, except with further testing for Lp(a)
among individuals in the ``High risk'' group immediately following risk estimation with SCORE2.
The result of this testing will be to reclassify risk based on Lp(a) levels. 
People with an Lp(a) of at least 192 nmol/L (90 mg/dL)
\footnote{
Just a note on units for Lp(a) in this protocol.
the original units provided in the UK Biobank and the prferred units for reporting in Australia
and the UK are nmol/L. However, for the model to function, we had to use
studies that reported the association of Lp(a) with outcomes in mg/dL. Therefore,
throughout, mg/dL are used in the model machinery, but results are reported in nmol/L. 
The conversion from nmol/L to mg/dL is not ideal, but the formula
Lp(a), nmol/L $=$ 2.18 $\times$ Lp(a), mg/dL $-$ 3.83 
has been shown to be highly accurate \cite{LangEHJ2019}.
All uses of Lp(a) in the protocol show both values, except when referring to the 
results of Mendelian randomisation studies.
} will be reclassified into the ``Very high risk'' category
and treated accordingly (even if more sophisticated interpretations have been 
recently recommended \cite{KronEHJ2022}, it will be impossible
to incorporate them into this analysis). Lp(a) levels of 105 nmol/L (50 mg/dL), 149 nmol/L (70 mg/dL) 
and 236 nmol/L (110 mg/dL) will be used in scenario analyses. 
Lp(a) testing will only occur once at the age the person first reaches threshold for testing.
In the control scenario, no Lp(a) testing will occur.

Therefore, the key difference between the intervention and control scenarios 
will be the number of individuals deemed ``Very high risk'' -- testing for Lp(a) in the intervention
scenario will lead to an increased number of individuals receiving LDL-C-lowering and SBP-lowering
treatment. 

Both the intervention and control are presented graphically in Figures~\ref{Control_schematic}-\ref{Intervention_schematic}.

\begin{landscape}
\begin{figure}[h!]
    \centering
    \caption{Schematic of the control scenario in study 1.}
    \includegraphics[width=1.4\textwidth]{Control.pdf}
    \label{Control_schematic}
\end{figure}

\begin{figure}[h!]
    \centering
    \caption{Schematic of the intervention scenario in study 1.}
    \includegraphics[width=1.4\textwidth]{Intervention.pdf}
    \label{Intervention_schematic}
\end{figure}
\end{landscape}

\clearpage
\subsection{Study 2: Lp(a) testing and treatment of Lp(a)}

The populations for this study will be the primary and secondary prevention populations initially
aged between 40 and 60 years, followed up until age 85 years (i.e., this study will use a lifetime horizon). 
We have deliberately not specified a country as this analysis will be repeated from the perspective of multiple countries.

The control scenario will be based on current standard of care using European guidelines on CVD prevention \cite{VisserenEHJ2021}.
Therefore, the control scenario in the primary prevention population will be identical to that described in the previous section.
For the secondary prevention population, the control situation will also be based on current guidelines for CVD prevention --
these people are universally considered very high risk, and so will be treated as per the ``very high risk'' category
described above. The control is outlined in Figure~\ref{Control_schematic_2}.

As above, the high intensity statin in this study will be atorvastatin 80 mg and pharmacological 
therapy for lowering SBP will be based on the SPRINT trial (losartan 100 mg, chlortalidone 25 mg, and amlodipine 10 mg) \cite{SPRINT2015}.

The intervention scenario will be as above, except with further testing for Lp(a) among
all individuals in the ``Very high risk'' category (via SCORE2 or from having diabetes or prior CVD).
From this testing, individuals with an Lp(a) of at least 192 nmol/L (90 mg/dL) will be treated with 
Olpasiran \cite{ODONEJM2022}. Based on the results of the phase 2 OCEAN(a)-DOSE trial 
(Olpasiran Trials of Cardiovascular Events and Lipoprotein[a] Reduction–Dose Finding Study),
the most effective dosing regimen of Olpasiran was 225 mg every 12 weeks, with similar adverse events
to other dosing regimens. This dosing reduced Lp(a) by 97.5\% (95\%CI: 94.0, 100.0). 
Lp(a) testing will only occur once at the age the person first reaches threshold for testing.
(In the control, no Lp(a) testing or treatment will occur). 
The intervention is outlined in Figure~\ref{Control_schematic_2}.

In scenario analyses, we will change the Lp(a) treatment threshold to 105 nmol/L (50 mg/dL), 149 nmol/L (70 mg/dL) 
and 236 nmol/L (110 mg/dL).

\begin{landscape}

\begin{figure}[h!]
    \centering
    \caption{Schematic of the control scenario in study 2.}
    \includegraphics[width=1.4\textwidth]{Control_2.pdf}
    \label{Control_schematic_2}
\end{figure}

\begin{figure}[h!]
    \centering
    \caption{Schematic of the intervention scenario in study 2.}
    \includegraphics[width=1.4\textwidth]{Intervention_2.pdf}
    \label{Intervention_schematic_2}
\end{figure}
\end{landscape}

\clearpage
\section{Model inputs}

\subsection{Model structure}

The structure of the model we will build to complete these studies is shown in Figure~\ref{Schematic}.
First note that of all the CVDs, only MI and stroke are
included in the model. This is for two reasons -- first, 
MI/CHD and stroke/CBD are responsible for the majority of the burden of 
CVD \cite{RothJACC2020}; second, the causes of these two conditions have been
studied at length, meaning that a model with reliable relationships
between risk factors and the risk for these two outcomes can be constructed.

The structure of the model is as follows. 
The model can run from ages 30 to 84 years (the risk of
diabetes and CVD before age 30 is negligible). 
Individuals can start in any health state.
The model runs in 1-year cycles (but cycle length is optional). 
In each cycle, the following events can occur:

\begin{itemize}
\item Individuals in the \emph{healthy} health state 
(i.e., individuals without diabetes or CVD) 
can experience the following events: development of diabetes; 
non-fatal MI; non-fatal stroke; fatal MI or 
coronary heart disease (CHD) death; fatal stroke or 
cerebrovascular disease (CBD) death; or non-CVD mortality.
\item Individuals who are in the \emph{diabetes} health state can experience
the following events: non-fatal MI; non-fatal stroke; fatal MI or 
CHD death; fatal stroke or CBD death; or non-CVD mortality.
\item Individuals in the \emph{MI} or \emph{stroke} health states
can experience the following events: development of diabetes; 
non-fatal MI; non-fatal stroke (i.e., repeat events); fatal MI or 
CHD death; fatal stroke or CBD death; or non-CVD mortality.
\item Individuals in the combination \emph{diabetes} and 
\emph{MI} and/or \emph{stroke} health states can 
experience the following events: 
non-fatal MI; non-fatal stroke (i.e., repeat events); fatal MI or 
CHD death; fatal stroke or CBD death; or non-CVD mortality. 
\end{itemize}

Note that non-CVD mortality includes a range of causes
of death, allowing for competing risks.
After each event, individuals move into the appropriate health state (or remain
in their present health state), with death being the only 
absorbing state in this model (Figure~\ref{Schematic}). 
People can only experience one event per cycle (hence the preference for a short cycle length).

\begin{figure}[h!]
    \centering
    \caption{Model structure. Repeat events can occur, but do not involve state transitions. 
Abbreviation -- MI: Myocardial infarction.}
    \includegraphics[width=1\textwidth]{Structure.pdf}
    \label{Schematic}
\end{figure}

The model includes 7 risk factors for the primary prevention population:
\begin{enumerate}
\item Age
\item Sex
\item Low density lipoprotein-cholesterol (LDL-C)
\item Lipoprotein(a) (Lp(a))
\item Systolic blood pressure (SBP)
\item Diabetes
\item Smoking
\end{enumerate}
LDL-C, SBP, diabetes, and smoking were selected because they
are the modifiable causal risk factors in both the Framingham 
risk score and pooled cohort equation \cite{WilsonCirc1998,GoffCirc2014}; 
Lp(a) was included because it is causal for both MI and stroke
and is an important risk factor for CVD in a subset of the population with high Lp(a)
\cite{LaminaJAMAC2019,LarssonCirc2020,WelshEJPC2021}. 

The way each of these will be integrated into the model is different
and depends on the causal structure of the relationship between
each risk factor and each outcome. All the modifiable risk factors
(i.e., all except age and sex)
will be integrated using evidence from Mendelian randomisation (MR) studies (see below). Age and
sex are the risk factors used as a baseline for others to 
interact with -- i.e., they will be used to establish the age and sex-specific incidence of 
MI, stroke, diabetes, and death, and other risk factors can modify this incidence
via their causal effects derived from MR. 

For secondary prevention the risk is just related to age and sex,
because the risk for people post-event is very high and less related
to the risk factors preceding the event. Nevertheless, Olpasiran
will still be assumed to modify the risk of a secondary event, which will 
also also be incorporated using evidence from MR. However, the mechanism by 
which this will be done is still be developed and will be included in an updated 
version of the protocol. 
Therefore, all discussion of risk factors
hereafter refers to the primary prevention population.

The rationale for using MR to derive the causal effects has been explained in detail previously \cite{AdemiPE2022}. 
Briefly, while randomised controlled trials remain the gold standard for causal evidence, 
there are situations in which trials cannot be performed (such as when the time horizon 
is too long or cost is too high, as in primary prevention of CVD). Observational studies 
cannot fill this evidence gap because they provide less reliable estimates of the effects 
of risk factor modification. Therefore, we have proposed that when a randomised clinical 
trial that would produce the results required to inform a health economic model is not 
possible or practical, health economic models should be based on causal effects derived 
from Mendelian randomisation analyses \cite{AdemiPE2022}. This is because Mendelian randomisation, 
when combined with knowledge of disease pathophysiology and other forms of 
epidemiological evidence, can allow for causal inference from observational data, 
which can be used for the design of health economic models that incorporate the long-term, 
cumulative effects of risk factors (e.g., cholesterol-years or blood pressure-years) 
on the risk for CVD, an approach we have pioneered \cite{MortonPECA2023}.

\clearpage
\subsection{Risk factors and outcomes}
\label{RFOsec}

The effects of risk factors on outcomes (in the primary prevention population) 
in this study will be integrated via Mendelian randomisation, 
based on a state-of-the-art approach we have previously designed and described \cite{MortonPECA2023}. 
This approach is underpinned by the simulation of risk factor trajectories over the lifetime, 
which are used to estimate the cumulative exposure to cardiovascular risk factors 
(e.g., cholesterol-years or blood pressure-years), which in turn, are used to 
modify cardiovascular risk. This approach is preferable to the use of hazard 
ratios from clinical trials, which likely don't incorporate the long-term benefits 
of exposure to lower levels of cumulative, causal risk factors \cite{AdemiPE2022}. 

Indeed, for four of the key cardiovascular risk factors – LDL-C, SBP, Lp(a), 
and smoking – the effect of these risk factors on cardiovascular risk is 
proportional to both magnitude of exposure (i.e., absolute levels of the 
risk factor) and duration of exposure (i.e., time spent exposed to the risk 
factor) \cite{FerenceJAMA2019,PopeAQAH2010,BurgessJAMAC2018}. This is essentially the concept of cholesterol-years, blood 
pressure-years, or smoking pack-years \cite{ShapiroJACC2020}. Results from Mendelian randomisation 
can quantify the effect of exposure to the risk factor over the lifetime but 
cannot provide an age- or exposure-specific estimate of effect. 
Thus, the key assumption underlying the relationship of LDL-C, Lp(a), 
and SBP with CVD risk will be that CVD risk is proportional to the 
time-weighted mean cumulative level of the risk factor at a given age. 
For smoking, the cumulative impact will be captured using the lifetime 
smoking index (LSI) \cite{WoottonPM2020}, which incorporates the non-linear effects of 
duration of smoking, time since cessation of smoking, and number of cigarettes smoked per day.

Thus, simulating cumulative risk factors values integrates both duration of exposure to, and magnitude of,
the risk factors in estimating their effects on CVD risk.
In this way, the causal biology of CVD is integrated into the health economic model.

Thus, the first task is to summarise the existing evidence for each risk factor/outcome
pair and go through their causal structures. While conducting a complete systematic
review for each exposure-outcome pair would be the ideal to go about this, 
it would be prohibitively time-consuming. Therefore, studies were selected by
1) performing a targeted literature search; 2) identifying key studies that contain information
on the exposure-outcome pair; 3) summarising the results; 4) selecting an estimate based on consistency,
study robustness (e.g., sufficient sample size, investigation of instrumental variable assumptions is clear,
there is no evidence of directional pleiotropy, etc.),
and precision of the estimate. In general, we have used inverse-variance weighted estimates/the 
main estimate presented by the authors. 

Finally, before describing the specific associations between risk factors and outcomes, 
the following are some general notes on the methods used. 

First, the effects of the risk factors are incorporated into the model using the following formula: 
\begin{quote}
\begin{math}
R_a = R \times M^{x-\mu}
\end{math}
\end{quote}
where 
\begin{math} R_a \end{math} is the adjusted age and sex-specific rate of CVD,  
\begin{math} R \end{math} is the age- and sex-specific rate of CVD for the whole population, 
\begin{math} M \end{math} is the measure of association from a Mendelian Randomisation study, 
\begin{math} x \end{math} is the time-weighted mean cumulative level of the risk factor (or LSI) for the individual in the simulation, and 
\begin{math} \mu \end{math} is the time-weighted mean cumulative level of the risk factor 
(or LSI) across the population used to derive the age- and sex- specific rate for the whole population.  
Thus, this formula provides an estimate of the age-specific rate of CVD for an individual 
based on their exposure to risk factors over the lifetime. 
To estimate the time-weighted mean cumulative level of the risk factor (or LSI) at any age, 
the risk factor trajectory over the lifetime needs to be simulated.
The approach to this for each risk factor is outlined in section~\ref{rftrajsec}.  

For diabetes, incorporating duration of exposure and magnitude of exposure 
(i.e., to elevated glucose) was deemed impractical for this model; thus, 
the effect of diabetes on the risk of CVD was incorporated using the following formula:  
\begin{quote}
\begin{math}
R_{DM} = R_{NoDM} \times M
\end{math}
\end{quote}
where
\begin{math} R_{DM} \end{math} is the age and sex-specific rate of CVD in people with diabetes,  
\begin{math} R \end{math} is the age and sex-specific rate of CVD in people without diabetes, and 
\begin{math} M \end{math} is the measure of association from a Mendelian Randomisation study (a rate ratio in this instance). 

Second, MR studies usually report odds ratios (ORs), which need to be converted into relative risks (RRs) before use
in the model we are building here. Thus, we will convert ORs to RRs using the following formula from Zhang et al \cite{ZhangJAMA1998}:
\begin{quote}
\begin{math} 
RR = \frac{OR}{(1-P_0)+(P_0 \times OR)}
\end{math}
\end{quote}
where \begin{math} OR \end{math} is the OR, 
\begin{math} RR \end{math} the relative risk, and 
\begin{math} P_0 \end{math} the risk of the outcome
in the unexposed group (we use the overall risk when risk in the unexposed group is unavailable).
(The confidence intervals (CIs) will be determined by passing the lower and upper bounds of the original
CIs through this formula.)

Third, it will not be sufficient to simply use mean cumulative values of risk factors; instead
we will need to use time-weighted mean cumulative values.
This is because it is highly likely that the effect 
of risk factors is not constant throughout life and more recent values are more influential. 
For example, with LDL-C, the most compelling evidence for this is simply the hazard ratio (HR) from 
a meta-analysis of statin trials -- the HR for any major coronary event 
in trials with durations ranging from 2-5+ years and starting from around age 60 years
is 0.77 (95\% CI: 0.74, 0.80) per 1 mmol/L reduction in LDL-C \cite{CTTLancet2005}. 
Compare this to the lifetime estimate of 0.46, above, which was derived from a population
with a mean age of 65 years. If the effect of LDL-C on coronary heart disease (CHD) risk was constant over the lifetime,
there is no way that 65 years of ``damage'' could be un-done in such a small amount of time
and produce such a favourable HR. The exact relationship between time, risk factors, 
and CVD risk has been established \cite{MortonVIH2024}. 

Fourth, the LSI is defined by the following formula:
\begin{quote}
\begin{math} 
LSI = (1-0.5^{\frac{dur}{18}}) \times (0.5^{\frac{tsc}{18}}) \times ln(int+1)
\end{math}
\end{quote}
where \begin{math} LSI \end{math} is the lifetime smoking index, 
\begin{math} dur \end{math} is duration of smoking,
\begin{math} tsc \end{math} is time since cessation of smoking,
\begin{math} 18 \end{math} is the half-life
(derived in \cite{WoottonPM2020}) that captures the non-linear
risk of smoking on health, 
and \begin{math} int \end{math} is number of cigarrettes per day. 

\clearpage
\subsubsection{Risk factors for MI}

\begin{itemize}

\item LDL-C. For LDL-C and MI, the effect is summarised with the OR
of 0.46 (95\%CI: 0.43, 0.48) per mmol/L reduction in LDL-C over the lifetime \cite{FerenceJAMA2019}
(an effect estimate consistent with other major MR studies of this association
\cite{FerenceJACC2012,HolmesEHJ2015,FerenceNEJM2016}). Converting into a relative risk
yields 0.48 (95\%CI: 0.45, 0.50) per mmol/L reduction in LDL-C over the lifetime, or 2.083 
(2.000, 2.222) per 1 mmol/L increase in lifetime LDL-C (i.e., flipping the fraction). 

\item SBP. For SBP and MI, the effect is summarised with the OR of 0.55 (0.52, 0.59) 
per 10mmHg reduction in SBP \cite{FerenceJAMA2019} (again, consistent
with other MR studies of this association \cite{FerenceHT2014,HigginsJAHA2021}). This yields
a relative risk of 0.57 (95\%CI: 0.54, 0.61) per 10 mmHg reduction in SBP over the lifetime or
1.754 (1.639, 1.862) per 10 mmHg increase in SBP over the lifetime. Mathematically, it's easier to deal in 
per-unit increases, so this relative risk is betwee summarised as 1.058 (1.051, 1.064) per 1 mmHg increase in SBP. 

\item Lp(a). For Lp(a) and MI, the effect is summarised with an OR for CHD of 0.912 (0.899, 0.925) 
per 10-mg/dL lower Lp(a) over the lifetime \cite{LaminaJAMAC2019}. This study was selected over the
other major Lp(a) study in this space by Burgess et al. \cite{BurgessJAMAC2018} as the major population
in Burgess et al. does not appear to have representative Lp(a) values \cite{LaminaJAMAC2019}. 
Lamina et al. estimated that each 10-mg/dL lower Lp(a) level is associated with 
an OR for CHD of 0.912 (0.899, 0.925). Converting to a relative risk per unit increase and flipping the association
yields 1.0054 (1.0045, 1.0062) per 1 mg/dL increase in lifetime Lp(a).

\item Smoking. For smoking and MI, the effect is summarised by the OR of 1.48 (1.25, 1.75) 
per 1 $\sigma$ increase in the LSI \cite{LevinJAMANO2021}. This study was selected over the 
other major study of this by Larsson et al (1.71 (1.49, 1.98) per 1 $\sigma$ increase in the LSI \cite{LarssonEHJ2020})
because it is more conservative. The standard deviation ($\sigma$) of the LSI in the population
under study was 0.694. Converting to a relative risk per unit increase gives us an input to the model of 
1.43 (1.22, 1.62) per 1 unit increase in the LSI.

\item Diabetes. For diabetes and MI, the effect is summarised with the OR of 
1.57 (95\%CI: 1.16, 2.05) for people with diabetes vs. without diabetes \cite{RossEHJ2015}. This was selected over
the other study in this space (OR of 2.43 (1.21, 4.91) \cite{GanDC2019}) because it was more 
conservative and precise. Converting to a relative risk yields 1.26 (1.08, 1.40) for diabetes vs. no diabetes.

\end{itemize}

To integrate these effects into the model, it is necessary to determine how they interact. 
For LDL-C and SBP, Ference et al. have shown that the effects are additive \cite{FerenceJAMA2019}
-- i.e., they're independent, so they can be 
integrated by applying the effects sequentially (applied sequentially, 
which people refer to as additive, but multiplicative in mathematical terms). 
Similarly, Lp(a) is independent of LDL-C (and thus very likely 
also independent from SBP) \cite{BurgessJAMAC2018}. 

For smoking, Levin et al. \cite{LevinJAMANO2021} showed, using 
multivariable MR, that the genetic liability to smoke was not mediated through
other cardiovascular risk factors (including lipids and SBP). 
Thus, the effect of smoking on CHD can be considered additive to LDL-C, SBP, and LP(a). 
Similarly, for diabetes, Ross et al. \cite{RossEHJ2015} and Yeung et al. \cite{YeungDC2018}
have both shown evidence that the effect of diabetes on CHD is similar
adjusted the association of diabetes with CHD is independent of other 
risk factors. 

Thus, all risk factors for MI will be incorporated additively (multiplicatively). 


\clearpage
\subsubsection{Risk factors for stroke}

In this model, stroke is split into ischaemic and haemorrhagic (or intracerebral haemorrhage (ICH))
as the two major kinds of stroke, with different aetiologies \cite{HilkensLancet2024}
and thus different risk factors.

First, for ischaemic stroke (IS), the risk factors and their strength of association
are as follows. 

\begin{itemize}

\item LDL-C. For LDL-C and IS, the effect is summarised with the OR
of 1.08 (1.03, 1.14) per $\sigma$ increase in LDL-C over the lifetime \cite{YuanAN2020}.
This study was selected as the most precise of the studies in this area (\cite{HindyStroke2018,ValdesNeur2019}). 
One standard deviation in this study was 0.87 mmol/L. Thus, converting this estimate to a relative risk for use
in this study yields 1.08 (1.03, 1.14) per 1 mmol/L increase in lifetime LDL-C.

\item SBP. For SBP and IS, the effect is summarised with the OR of 
1.32 (1.20, 1.46) per 10mmHg increase in SBP \cite{WanHyp2021}, selected as the most conservative study
in the area \cite{WanHyp2021,ChanSR2021,ClarkeHype2023}. Converting to a one-unit
relative risk yields 1.027 (1.018, 1.037) per 1 mmHg increase in SBP. 

\item Lp(a). For Lp(a) and IS, the effect is summarised with the OR 
of 1.19 (1.12, 1.25) for IS per 50 mg/dL increase in Lp(a) \cite{LarssonCirc2020},
or a relative risk of 1.0035 (1.0023, 1.0045) per mg/dL increase in Lp(a). This was
selected as the only study we could find at the time of the search.

\item Smoking. For smoking and IS, the effect is summarised with the OR of
1.24 (1.17, 1.33) per 1 $\sigma$ increase in the LSI \cite{LarssonAN2019}. This was selected as the most
precise estimate out of the avialable studies in the field \cite{LarssonEHJ2020,LarssonAN2019,HarshfieldStroke2021}.
Converted to a relative risk per unit increase yielded 1.33 (1.22, 1.46)
per 1 unit increase in the LSI. 

\item Diabetes. For diabetes and IS, the effect is summarised with the OR of 
1.91 (1.22, 2.98) for people with vs. without diabetes \cite{GanDC2019}. This was selected as the only
study we could find that presented the effect of diabetes on IS for people with vs. without diabetes
(despite others presenting the association between diabetes risk and IS risk 
\cite{LarssonNeur2017,LiuGenes2021,GeorgakisNeur2021}). Converting to a relative
risk yields 1.74 (1.19, 2.47).

\end{itemize}

Second, for ICH, the risk factors and their strength of association
are as follows. 

\begin{itemize}

\item LDL-C. There is no consistent evidence of an association between LDL-C and ICH \cite{FalconeAN2020,YuAN2022}.

\item SBP. For SBP and ICH, the effect is summarised with the OR of 
1.47 (1.10, 1.95) per 10mmHg increase in SBP \cite{WanHyp2021}, which was more conservative when compared
with the other study in this area \cite{ClarkeHype2023}. Converting to a relative risk per unit increase yields
1.039 (1.010, 1.069) per 1 mmHg increase in SBP over the lifetime. 

\item Lp(a). Larsson et al. found no evidence that Lp(a) influences risk of ICH \cite{LarssonCirc2020}. 

\item Smoking. Smoking does not appear to cause ICH \cite{LarssonEHJ2020,LarssonAN2019,HarshfieldStroke2021}.

\item Diabetes. Diabetes does not appear to be causual for ICH \cite{LiuGenes2021,GeorgakisNeur2021}.

\end{itemize}

For IS, we will assume a similarity in biology to MI. 
Therefore, the interactions will be assumed to be the same as for MI (i.e., 
all additive),
and for ICH, there is only one risk factor included in the 
model, so there is no need to address any interactions. 



\clearpage
\subsubsection{Risk factors for diabetes}


\begin{itemize}

\item LDL-C. The relative risk for diabetes will be 0.763 (0.645, 0.909) per 1 mmol/L increase in lifetime LDL-C
in a scenario analysis, but excluded from the primary analysis.
This is discussed in detail below. 

\item SBP. There is no clear effect of SBP on type 2 diabetes risk 
\cite{AikensDiabetes2017,SunCR2019,ZhuNC2018}.

\item Lp(a). There is no clear effect of Lp(a) on type 2 diabetes risk 
\cite{KamstrupLDE2013,YeDiabetes2014,EmdinJACC2016,BuchmannAcDi2017,LarssonMet2022}.

\item Smoking. The effect of smoking on diabetes risk can be summarised using the OR of 
1.18 (1.02, 1.37) per 1 $\sigma$ increase in the LSI \cite{LarssonEBM2022}. This study 
was selected as the most conservative out of the available studies 
that used the LSI to estimate the effect \cite{ThomHMG2020,YuanDLGIA2020,LarssonEBM2022}.
Converted to a relative risk per unit increase yields 1.21 (1.03, 1.41) per unit increase in the LSI. 

\end{itemize} 

While not explicitly addressed by either study, 
it's probably reasonable to assume 
the the effects of LDL-C and smoking
on diabetes risk are independent. 

Because it may be considered controversial, 
it is worth outlining in detail the relationship between LDL-C and type 2 diabetes risk. 
Lowering LDL-C via statins increases the risk of diabetes in trials in a dose-dependent manner
\cite{SattarLancet2010,PreissJAMA2011,ReithLDE2024}, suggesting a causal relationship between
response to statin response/dose and risk of diabetes. 
Indeed, multiple MR studies have shown an an association between genetically predicted 
LDL-C and type 2 diabetes risk \cite{SoremekunEBM2022,FerenceNEJM2016,LottaJAMA2016}.

While a recent review found the increased risk of type 2 diabetes was mostly among people 
who were already close to the diagnostic threshold for diabetes
at the beginning of the trials \cite{ReithLDE2024}, it is not surprising that in short-term clinical trials the only people who 
develop diabetes or experience an increase in blood glucose are people with already elevated risk for type 2 diabetes, 
as there is a long period prior to onset of diabetes where insulin resistance can worsen without 
any impact on glycaemia (the pathophysiology of type 2 diabetes is excellently reviewed here: \cite{DeFronzoDiabetes2009}), 
meaning people at earlier stages of insulin dysfunction could experience a decrement in insulin 
resistance without any change in blood glucose. 

Ultimately, it is plausible that lower or lowering LDL-C causes type 2 diabetes,
especially with statins. 
However, it is unclear by what mechanism this occurs and whether this occurs across
all methods of LDL-C lowering. 
The reasons we argue this should be included as a scenario analysis and not in the primary analysis are: 1)
because of the high degree of uncertainty about how this association plays out, and its
magnitude; and 2) when included, it is extremely influential on the findings, which shouldn't be the case
for an association that is this uncertain. Thus, we have elected to exclude this controversial and uncertain
effect from the primary analysis.

The key question for incorporating this effect into the model is whether
the effect is related to cumulative LDL or instantaneous LDL. 
One piece of evidence for the relationship between LDL and CHD
being cumulative is the fact that MR effect estimates are always
much greater than clinical trials \cite{FerenceEHJ2017}. 
For diabetes, the effect estimate from a meta-analysis of
clinical trials was an OR of 1.09 (95\%CI: 1.02, 1.17)
for statin use vs. placebo (usually at least 1mmol/L reduction in LDL-C), 
whereas the MR associations are greater:
\begin{itemize}
\item 1.11 (1.04, 1.19) per 10mg/dl (~0.25mmol/L) reduction in LDL-C (PCSK9 genetic score) \cite{FerenceNEJM2016}
\item 1.13 (1.06, 1.20) per 10mg/dl (~0.25mmol/L) reduction in LDL-C (HMGCR genetic score) \cite{FerenceNEJM2016}
\item 1.13 (1.00, 1.29) per mmol/L reduction in LDL-C (LDLR) \cite{LottaJAMA2016}
\item 1.15 (0.89, 1.48) per mmol/L reduction in LDL-C (ABCG5/G8) \cite{LottaJAMA2016}
\item 1.19 (1.02, 1.38) per mmol/L reduction in LDL-C (PCSK9) \cite{LottaJAMA2016}
\item 1.39 (1.12, 1.73) per mmol/L reduction in LDL-C (HMGCR) \cite{LottaJAMA2016}
\item 2.42 (1.70, 3.43) per mmol/L reduction in LDL-C (NPC1L1) \cite{LottaJAMA2016}
\end{itemize}
(Abbreviations: PCSK9 -- proprotein convertase subtilisin/kexin type 9; 
HMGCR -- 3-hydroxy-3-methyl-glutaryl-coenzyme A reductase; 
LDLR -- LDL receptor;
NPC1L1 -- Niemann-Pick C1-Like 1)
I.e., like for CHD, the MR associations for diabetes are greater than those in
clinical trials, suggesting the effect of LDL-C on diabetes risk is indeed
cumulative. 

The effect we will use in the model will be the 1.39 (1.12, 1.73) per 1 mmol/L 
reduction in LDL-C for the HMGCR from Lotta et al \cite{LottaJAMA2016}. This was selected because
 it is the only estimate that is consistent between the two studies above and because there is
additional causal evidence from statin clinical trials
to support this association (HMGCR is the target of statins).
This is the same as a relative risk of 0.763 (0.645, 0.909) per 1 mmol/L increase in lifetime LDL-C.


\clearpage
\subsubsection{Risk factors for death}

The risk of fatal MI/CHD death and stroke/CBD death
will be incorporated in the same way as for the non-fatal
events. I.e., the effect of risk factors on these outcomes
will be the same for non-fatal and fatal events. 

However, even though they are a substantial proportion,
CVD deaths are a minority of deaths. This means 
other deaths are an important competing risk. 
As previously determined (ref), the causes of death (and their ICD-10 codes)
in the UK Biobank study that constitute $\geq$1\% of all
deaths are as follows.

\begin{itemize}
\item Cancers
\begin{itemize}
\item Oesophageal cancer (C15)
\item Stomach cancer (C16)
\item Colorectal cancer (C18-20)
\item Liver cancer (C22)
\item Pancreatic cancer (C25)
\item Lung cancer (C34)
\item Mesothelioma (C45)
\item Breast cancer (C50)
\item Ovarian cancer (C56)
\item Prostate cancer (C61)
\item Kidney cancer (C64)
\item Bladder cancer (C67)
\item Brain cancer (C71)
\item Unspecified site (C80)
\item Multiple myeloma (C90)
\item Monocytic leukaemia (C92)
\end{itemize}

\item CVD
\begin{itemize}
\item Ischaemic heart diseases (I20-25)
\item Cerebrovascular diseases (I60-69)
\end{itemize}

\item Respiratory diseases
\begin{itemize}
\item Pneumonia (J18)
\item Other chronic obstructive pulmonary disease (J44)
\item Other interstitial pulmonary diseases (J84)
\end{itemize}

\item Nervous system diseases
\begin{itemize}
\item Spinal muscular atrophy and related syndromes (G12)
\item Parkinson's disease (G20)
\item Alzheimer's disease/dementia (F01, F03, G30)
\end{itemize}
\end{itemize}

We should briefly note that these causes of death are not necessarily
representative of the overall causes of death across life (UK Biobank participants were overwhelmingly 
aged 40-69 at recruitment), but will be useful for our purposes
because they will be the main competing causes of death for CVD
in the model timeframe (ages 30-84). 

For cancers, there is little evidence that LDL-C, Lp(a), SBP, or diabetes are causal 
for any major cancers \cite{BennJNCI2011,PierceCER2018,LarssonMet2022,YuanDC2020,PearsonCEB2021}.
Of course, smoking is causual for a range of cancers, and the causual effect of smoking on most
cancers estimated in MR studies has recently been reviewed by Larsson and BUrgess 
\cite{LarssonEBM2022}. In this study, they show associations
between the LSI and the following cancers that were on the 
list of major causes of death above
(all ORs per 1 $\sigma$ increase in the LSI):

\begin{itemize}
\item Bladder cancer -- OR: 1.91 (1.42, 2.56)
\item Colorectal cancer -- OR: 1.18 (1.04, 1.33)
\item Oesophageal cancer -- OR: 2.47 (1.43, 4.27)
\item Kidney cancer -- OR: 1.50 (1.03, 2.17)
\item Lung cancer -- OR: 6.39 (4.64, 8.80)
\item Ovarian cancer -- OR: 1.20 (1.03, 1.41)
\item Pancreatic cancer -- OR: 1.69 (1.10, 2.58)
\end{itemize}

which can be converted into RRs per unit increase as follows:

\begin{itemize}
\item Bladder cancer -- RR: 2.52 (1.66, 3.81)
\item Colorectal cancer -- RR: 1.24 (1.06, 1.44)
\item Oesophageal cancer -- RR: 3.67 (1.67, 8.02)
\item Kidney cancer -- RR: 1.69 (1.04, 3.05)
\item Lung cancer -- RR: 13.64 (8.85, 21.03)
\item Ovarian cancer -- RR: 1.27 (1.04, 1.57)
\item Pancreatic cancer -- RR: 2.13 (1.15, 3.90)
\end{itemize}

For respiratory diseases, 
LDL-C, Lp(a), and type 2 diabetes don't appear to be causal for 
lower respiratory tract infections (Pneumonia) \cite{FlatbyCMI2022,LarssonMet2022,FlatbyCMI2022,WangFG2021}.
Whereas SBP and smoking do appear to be \cite{FlatbyCMI2022,ZekavatMed2021,FlatbyCMI2022,KingECM2020,ZhuIDT2023,RosoffCB2021}.

The effect sizes for lower respiratory tract infections are as follows:
\begin{itemize}
\item SBP: HR of 1.08 (1.04, 1.13) per 5 mmHg increase in SBP \cite{ZekavatMed2021},
converted into an RR of 1.016 (1.008, 1.025) per 1 mmHg increase in SBP. 
\item Smoking: OR of 2.83 (2.34, 3.42) per $\sigma$ increase in the LSI \cite{FlatbyCMI2022},
conveted into an RR of 4.03 (3.16, 5.11) per unit increase in the LSI.
\end{itemize}

For chronic obstructive pulmonary disease (COPD),
LDL-C, Lp(a), and SBP do not appear to be associated with COPD 
\cite{BrumptonCGPM2019,LarssonMet2022,ClarkeHype2023},
and there is scant evidence for diabetes. 

Smoking is causal for COPD, although this is so well-known
that we can only find two studies that bothered to do the MR.
The first, Rosoff et al., found an OR of 2.08 (1.49, 2.88)
per unit increase in the LSI. This doesn't seem plausible
given how strong the association between the LSI and lung 
cancer is (OR: 6.39 (4.64, 8.80) \cite{LarssonEBM2022})
and the fact that the association of smoking with 
emphysema was stronger than smoking and respiratory cancers
in the only other study we found on this \cite{KingECM2020}. 
Unfortunately, this other study reports the effect of smoking 
per extra cigarette smoked per day. Therefore, we will
use the OR from lung cancer for emphysema/COPD. 

The final category contains mostly  ``idiopathic pulmonary fibrosis'',
which, being idiopathic, shouldn't be included in a model that involves integrating
disease biology (given that by definition we don't know the biology of this disease). 

Finally, the nervous system diseases. 
``Spinal muscular atrophy and related syndromes'' is almost entirely motor neuron disease,
for which SBP, Lp(a), smoking, and diabetes all do not appear to be causal 
\cite{JulianB2022,LarssonMet2022,XiaOJRD2022,BandresAN2019}. 
LDL-C, on the other hand, does appear to be causal \cite{ZengHMG2019,ChenNA2018,BandresAN2019},
with the only useable estimate coming from Zeng et al. \cite{ZengHMG2019},
with an OR of ALS of 1.14 (1.05, 1.24) per 39.0 mg/dL increase in LDL-C (~1 mmol/L). 
This can be converted into an RR of 1.09 (1.03, 1.14) per 1 mmol/L increase in LDL-C. 

For Parkinson's disease, LDL-C, Lp(a), SBP, and diabetes don't appear to be causal 
\cite{ZhaoFN2022,BennBMJ2017,WilliamsAN2020,LiuJAMANO2021,ParkJMD2023,JiangFP2023,LarssonMet2022,ChohanMD2021,ParkJMD2023}.
However, smoking is protective \cite{MappinN2020,SieurinJPD2021,DomSR2021,HeilbronJPD2021,LarssonEBM2022}.
The one study that has evaluated this using the LSI is Larsson et al \cite{LarssonEBM2022},
which presents an OR of 0.6 (0.4, 1.01) per $\sigma$ increase in the LSI, 
converted to an RR of 0.48 (0.27, 1.01) per unit increase in the LSI. 

For Alzheimer's disease/dementia, there is no conclusive evidence 
that any of LDL-C, Lp(a), SBP, smoking, or diabetes are causal risk factors
\cite{OsterPM2015,BennBMJ2017,DWilliamsAN2020,TanFM2022,LarssonCirc2020,PanStroke2019,
LarssonBMJ2017,OuART2021,WalkerIJE2020,ThomassenEPS2020,PanAging2020,LarssonEBM2022}.

\clearpage
\subsection{Utilities}

The primary analysis will be conducted in Australia and the UK. 
The utility inputs will be as follows:
\begin{itemize}
\item The utility value for people without diabetes, MI, or stroke in Australia, 
which has age and sex-specific values. 
This was derived from a cross-sectional study of the Australian general population by McCaffrey et al \cite{McCaffreyHQLO2016}
and modelled to get values for each age in 1-year increments below.
\item The chronic utility in people without diabetes, MI, or stroke in the UK, 
which has age and sex-specific values defined by the equation:
\begin{math} 0.9454933 + 0.0256466 \times male - 0.0002213 \times age - 0.0000294 \times age^2 \end{math}
This was derived from a repeated cross-sectional study of the UK general population by Ara and Brazier \cite{ARAVIH2010}.
\item The chronic utility for people with diabetes, set at 0.785 (0.681, 0.889), 
as recommended in a review of utility values for type 2 diabetes and its complications \cite{BeaudetVIH2014}.
\item The chronic utility for people with MI, set at 0.79 (95\%CI 0.73, 0.85), 
derived from a systematic review of utility values in MI \cite{BettsHQLO2020}. 
\item The chronic utility for people with stroke, set at 0.65 (95\%CI 0.63, 0.67), 
derived from a systematic review of utility values in stroke \cite{JoundiJAHA2022}. 
\item The chronic disutility for people with diabetes and MI, set at -0.055 (-0.067, -0.042),
again, as recommended in a review of utility values for type 2 diabetes and its complications \cite{BeaudetVIH2014}.
\item The chronic disutility for people with diabetes and stroke, set at -0.164 (-0.222, -0.105),
again, as recommended in a review of utility values for type 2 diabetes and its complications \cite{BeaudetVIH2014}.
\item The acute disutility associated with an MI, set at -0.01125 ($\pm$ 20\%). This was derived from a clinical 
trial that assessed the EQ-5D before hospital discharge and at 6 weeks and 3 months \cite{LaceyEJCN2004}. 
The difference between discharge EQ-5D score and the EQ-5D score at 3 months was 0.09, 
so assuming a linear increase means the mean disutility
throughout this period would be 0.045 (meaning a loss of 0.01125 for a cycle).
\item The acute disutility associated with a stroke, set at -0.03 ($\pm$ 20\%). This was derived from a systematic
review of utility values in stroke that examined the utility value prior to discharge from acute hospitalisation 
or rehabilitation \cite{JoundiJAHA2022}. 
At this time, the mean utility value was 0.41, which is 0.24 less than the value above (0.65),
which is the value from 3 months on. As with MI, assuming a linear increase, the mean value in this period would be 0.12 (
a loss of 0.03 over a cycle). 
\end{itemize}

To estimate 1-year sex and age-specific utility values for people without diabetes,
MI, or stroke in Australia, we will use beta regression. 
However, the first step must be to simulate a dataset, as all that McCaffrey and colleagues
have published are means and standard deviations for age ranges, as shown in Table~\ref{GPUTAU}.

\begin{table}[h!]
\centering
    \caption{Utility values for people without diabetes, MI, or stroke in Australia from McCaffrey et al \cite{McCaffreyHQLO2016}.}
    \label{GPUTAU}
	\begin{tabular}{lllll}
\hline
\multicolumn{1}{c}{Age category} & \multicolumn{2}{c}{Females} & \multicolumn{2}{c}{Males} \\
(years) & N & Mean (SD) & N & Mean (SD) \\
\hline
15-24 & 226 & 0.95 (0.08) & 238 & 0.96 (0.07) \\
25-34 & 224 & 0.95 (0.11) & 225 & 0.95 (0.10) \\
35-44 & 241 & 0.91 (0.13) & 238 & 0.93 (0.12) \\
45-54 & 253 & 0.87 (0.16) & 247 & 0.90 (0.16) \\
55-64 & 226 & 0.88 (0.15) & 217 & 0.90 (0.14) \\
65-74 & 193 & 0.87 (0.16) & 153 & 0.87 (0.16) \\
$\geq$75 & 122 & 0.82 (0.15) & 104 & 0.85 (0.16) \\
\hline
\end{tabular}
\end{table}

\color{Blue4}
***/

texdoc stlog, cmdlog
clear
set obs 2
gen sex = _n-1
expand 7
bysort sex : gen age = _n*10+10
gen UT = 0.95 in 1
replace UT = 0.95 in 2
replace UT = 0.91 in 3
replace UT = 0.87 in 4
replace UT = 0.88 in 5
replace UT = 0.87 in 6
replace UT = 0.82 in 7
replace UT = 0.96 in 8
replace UT = 0.95 in 9
replace UT = 0.93 in 10
replace UT = 0.90 in 11
replace UT = 0.90 in 12
replace UT = 0.87 in 13
replace UT = 0.85 in 14
gen SD = 0.08 in 1
replace SD = 0.11 in 2
replace SD = 0.13 in 3
replace SD = 0.16 in 4
replace SD = 0.15 in 5
replace SD = 0.16 in 6
replace SD = 0.15 in 7
replace SD = 0.07 in 8
replace SD = 0.10 in 9
replace SD = 0.12 in 10
replace SD = 0.16 in 11
replace SD = 0.14 in 12
replace SD = 0.16 in 13
replace SD = 0.16 in 14
texdoc stlog close
texdoc stlog
list, separator(0)
texdoc stlog close

/***
\color{black}

In order to generate random beta distribution values from this data, 
I first have to calculate the \begin{math} \alpha \end{math} and \begin{math} \beta \end{math}
values. The mean (\begin{math} \mu \end{math}) and variance (\begin{math} \sigma^2 \end{math})
of a beta distribution are given by:

\begin{quote}
\begin{math} 
\mu = \frac{\alpha}{\alpha + \beta}
\end{math}
\end{quote}

and

\begin{quote}
\begin{math} 
\sigma^2 = \frac{\alpha \beta}{(\alpha + \beta)^2 (\alpha + \beta + 1)}
\end{math}
\end{quote}

So, if solving for \begin{math} \alpha \end{math} and \begin{math} \beta \end{math}, it can be derived that:

\begin{quote}
\begin{math} 
\alpha = \mu^2 (\frac{1-\mu}{\sigma^2}-\frac{1}{\mu})
\end{math}
\end{quote}

and

\begin{quote}
\begin{math} 
\beta = \alpha (\frac{1}{\mu}-1)
\end{math}
\end{quote}

I can apply this to the values in the dataset:

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
gen alph = UT^2*(((1-UT)/(SD^2))-(1/UT))
gen beta = alph*((1/UT)-1)
texdoc stlog close

/***
\color{black}

Unfortunately, this gives an unusable value for 
females aged 25-34 years, so I will make a slight adjustment:

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
replace beta = 0.15 in 2
gen N = 226 in 1
replace N = 224 in 2
replace N = 241 in 3
replace N = 253 in 4
replace N = 226 in 5
replace N = 193 in 6
replace N = 122 in 7
replace N = 238 in 8
replace N = 225 in 9
replace N = 238 in 10
replace N = 247 in 11
replace N = 217 in 12
replace N = 153 in 13
replace N = 104 in 14
expand N
set seed 1836772
gen double A = rbeta(alph,beta)
replace A = 0.9999999999999 if A == 1
mkspline agesp=age, cubic knots(30(15)75)
betareg A agesp* if sex == 0
preserve
clear
set obs 45
gen age = _n + 39.5
mkspline agesp=age, cubic knots(30(15)75)
predict UT1
predict xb, xb
predict errr, stdp
gen UT = invlogit(xb)
gen UTlb = invlogit(xb - 1.96*errr)
gen UTub = invlogit(xb + 1.96*errr)
keep age xb errr UT-UTub
gen sex = 0
replace age = age-0.5
save UTF, replace
restore
betareg A agesp* if sex == 1
clear
set obs 45
gen age = _n + 39.5
mkspline agesp=age, cubic knots(30(15)75)
predict xb, xb
predict errr, stdp
gen UT = invlogit(xb)
gen UTlb = invlogit(xb - 1.96*errr)
gen UTub = invlogit(xb + 1.96*errr)
keep age xb errr UT-UTub
gen sex = 1
replace age = age-0.5
save UTM, replace
clear
append using UTF UTM
save UTvals_AU, replace
clear
set obs 2
gen sex = _n-1
expand 45
bysort sex : gen age = _n+39.5
gen UT = 0.9454933+0.0256466*sex-0.0002213*age - 0.0000294*(age^2)
replace age = age-0.5
save UTvals_UK, replace
texdoc stlog close
texdoc stlog, cmdlog
use UTvals_AU, clear
twoway ///
(rarea UTub UTlb age if sex == 0, col(red%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 0, color(red)) ///
(rarea UTub UTlb age if sex == 1, col(blue%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 1, color(blue)) ///
, legend(order(4 "Male" ///
2 "Female") ///
cols(1) ring(0) position(1) region(lcolor(white) color(none))) ///
graphregion(color(white)) ///
ytitle(Utility) xtitle(Age) ///
ylabel(,angle(0) format(%9.2f)) xlabel(40(10)80)
texdoc graph, label(AgeUT) figure(h!) cabove fontface("Liberation Sans") caption(Age and sex-specific utility for people without CVD or diabetes in Australia.)
use UTvals_UK, clear
gen UTlb = UT-(UT*0.0255*1.96)
gen UTub = UT+(UT*0.0255*1.96)
twoway ///
(rarea UTub UTlb age if sex == 0, col(red%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 0, color(red)) ///
(rarea UTub UTlb age if sex == 1, col(blue%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 1, color(blue)) ///
, legend(order(4 "Male" ///
2 "Female") ///
cols(1) ring(0) position(1) region(lcolor(white) color(none))) ///
graphregion(color(white)) ///
ytitle(Utility) xtitle(Age) ///
ylabel(,angle(0) format(%9.2f)) xlabel(40(10)80)
texdoc graph, label(AgeUTUK) figure(h!) cabove fontface("Liberation Sans") caption(Age and sex-specific utility for people without CVD or diabetes in the UK.)
texdoc stlog close

/***
\color{black}

\clearpage
\subsection{Costs}

\subsubsection{Healthcare perspective}

The cost inputs for Australia (in 2023 AUD) will be as follows:

\begin{itemize}
\item The annual chronic cost of diabetes, set at \$3,588 (95\% CI: 2,816, 4,539) \cite{MortonDLOGIA2023,LeeDRCP2013}. 
\item The annual chronic cost of MI, set at \$6,222 ($\pm$10\%) \cite{MarquinaEJPC2022,CobiacBMCPH2012}.
\item The annual chronic cost of stroke, set at \$4,388 ($\pm$10\%) \cite{MarquinaEJPC2022,CobiacBMCPH2012}.
\item The annual chronic cost of MI among people with diabetes, set at \$8,870 (6,804, 10,937) \cite{MortonDLOGIA2023,LeeDRCP2013}.
\item The annual chronic cost of stroke among people with diabetes, set at \$8,870 (6,804, 10,937) \cite{MortonDLOGIA2023,LeeDRCP2013}. 
\item The acute cost of non-fatal MI, set at \$14,434 ($\pm$10\%) \cite{MortonDLOGIA2023}.
\item The acute cost of non-fatal stroke, set a \$15,659 ($\pm$10\%) \cite{MortonDLOGIA2023}. 
\item The acute cost of fatal MI, set at \$3,363 ($\pm$10\%) (the non-fatal cost multiplied by the proportion of MIs that result in a hospitalisation (23.3\%; \cite{MortonVIH2024})).
\item The acute cost of fatal stroke, set a \$13,154 ($\pm$10\%) (the non-fatal cost multiplied by the proportion of strokes that result in a hospitalisation (84.0\%; \cite{MortonVIH2024})).
\item Lp(a) test cost, set at \$25, based on current out-of-pocket costs in Australia (Adam Livori, personal communication).
\item the annual cost of atorvastatin 80 mg, set at \$200 \cite{PBSDOS23}.
\item The annual cost of losartan 100 mg, set at \$200 \cite{PBSDOS23}.
\item The annual cost of chlortalidone 25 mg, set at \$143 \cite{PBSDOS23}.
\item The annual cost of amlodipine 10 mg, set at \$212 \cite{PBSDOS23}.
\item The annual cost of Olpasiran, set at set at \$4,360. Because there is no available price for Olpasiran yet, this price was based on the cost of another comparable biologic therapy used in the treatment of CVD -- evolocumab -- which has an annual price of \$4,360 in Australia \cite{PBSDOS23}.
\end{itemize}

All costs introduced came either directly from the PBS or from studies using costs in 2020 AUD, inflated to 
2023 AUD using the Health Price Index of \begin{math}
1.020 \times 1.029 \times 1.042 \end{math} \cite{AUSHPI23}.
How drug costs were arrived at is shown below -- losartan is not widely available in Australia,
so costs were sourced from candesartan 32mg.

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
quietly {
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"ATORVASTATIN")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "ATORVASTATIN Tablet 80 mg (as calcium)"
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Atorvastatin 80 mg " 365.25*r(mean)/30
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"CANDESARTAN")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "CANDESARTAN Tablet containing candesartan cilexetil 32 mg"
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Candesartan " 365.25*r(mean)/30
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"CHLORTALIDONE")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Chlortalidone " 365.25*r(mean)/50
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"AMLODIPINE")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Amlodipine " 365.25*r(mean)/30
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"EVOLOCUMAB")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "EVOLOCUMAB Injection 140 mg in 1 mL single use pre-filled pen"
gen unitcost = total_cost/prescriptions
gen injectioncost = unitcost/3 if item_code == "10958R" | item_code == "11977J"
replace injectioncost = unitcost/2 if item_code == "11484K" | item_code == "11985T"
su injectioncost [aweight=prescriptions]
noisily di "Evolocumab 140mg " 365.25*r(mean)/14
}
texdoc stlog close
texdoc stlog
quietly {
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"ATORVASTATIN")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "ATORVASTATIN Tablet 80 mg (as calcium)"
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Atorvastatin 80 mg " 365.25*r(mean)/30
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"CANDESARTAN")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "CANDESARTAN Tablet containing candesartan cilexetil 32 mg"
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Candesartan " 365.25*r(mean)/30
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"CHLORTALIDONE")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Chlortalidone " 365.25*r(mean)/50
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"AMLODIPINE")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Amlodipine " 365.25*r(mean)/30
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"EVOLOCUMAB")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "EVOLOCUMAB Injection 140 mg in 1 mL single use pre-filled pen"
gen unitcost = total_cost/prescriptions
gen injectioncost = unitcost/3 if item_code == "10958R" | item_code == "11977J"
replace injectioncost = unitcost/2 if item_code == "11484K" | item_code == "11985T"
su injectioncost [aweight=prescriptions]
noisily di "Evolocumab 140mg " 365.25*r(mean)/14
}
texdoc stlog close

/***
\color{black}

\clearpage
The cost inputs for the UK (in 2023 GBP) will be as follows:
\begin{itemize}
\item The annual chronic cost of diabetes, set at \textsterling 2,546 (95\% CI: 2,462, 2,633) for females and \textsterling 2,170 (2,090, 2,254) for males \cite{PHEcosts2020}. 
\item The annual chronic cost of MI, set at \textsterling 3,304 (3,026, 3,607) for females and \textsterling 2,917 (2,701, 3,149) for males \cite{PHEcosts2020}. 
\item The annual chronic cost of stroke, set at \textsterling 7,021 (5,852, 8,421) for females and \textsterling 7,351 (5,923, 8,062) for males \cite{PHEcosts2020}. 
\item The annual chronic cost of MI and stroke, set at \textsterling 14,442 (9,929, 21,004) for females and \textsterling 12,616 (8,484, 18,756) for males \cite{PHEcosts2020}. 
\item The annual chronic cost of MI among people with diabetes, set at \textsterling 4,511 (3,947, 5,155) for females and \textsterling 3,917 (3,480, 4,409) for males \cite{PHEcosts2020}. 
\item The annual chronic cost of stroke among people with diabetes, set at \textsterling 10,014 (7,615, 13,167) for females and \textsterling 10,494 (7,701, 14,300) for males \cite{PHEcosts2020}. 
\item The acute cost of non-fatal MI, set at \textsterling 2,212 ($\pm$10\%) (see Table~\ref{MISTUKcost}) \cite{NHSCOST202122}.
\item The acute cost of non-fatal stroke, set a \textsterling 4,626 ($\pm$10\%) (see Table~\ref{MISTUKcost}) \cite{NHSCOST202122}. 
\item The acute cost of fatal MI, set at \textsterling 515 ($\pm$10\%) (derived from the NHS cost schedule \cite{NHSCOST202122}, multiplied by the proportion of MIs that result in a hospitalisation (23.3\%; \cite{MortonVIH2024})).
\item The acute cost of fatal stroke, set a \textsterling 3,886 ($\pm$10\%) (derived from the NHS cost schedule \cite{NHSCOST202122}, multiplied by the proportion of strokes that result in a hospitalisation (84.0\%; \cite{MortonVIH2024})). 
\item Lp(a) test cost, set at \textsterling 40 (assumption). 
\item The annual cost of atorvastatin 80 mg, set at \textsterling 18.00 \cite{NHSDrugTariff062023}.
\item The annual cost of losartan 100 mg, set at \textsterling 15.91 \cite{NHSDrugTariff062023}.
\item The annual cost of chlortalidone 25 mg, set at \textsterling 12.42 \cite{NHSDrugTariff062023} (this cost was based on indapimide 2.5 mg as chlortalidone is very expensive in the UK).
\item The annual cost of amlodipine 10 mg, set at \textsterling 9.91 \cite{NHSDrugTariff062023}.
\item The annual cost of Olpasiran, set at set at \textsterling 3975. Because there is no available price for Olpasiran yet, this price was based on the cost of the other siRNA therapy used in the treatment of CVD -- inclisiran -- which has an annual price of \textsterling 3975 in the UK \cite{NHSDMDInclisiran2024}.
\end{itemize}

All costs (except Lp(a) testing and Olpasiran) introduced came either directly from the NHS drug tariff in June 2023 \cite{NHSDrugTariff062023}
, the NHS 2022/23 cost schedule \cite{NHSCOST202223}, or from a Public Health England healthcare costs
study \cite{PHEcosts2020}, which used costs in 2016 GBP, which were inflated to 2023 GBP using 
the NHS cost inflaction index \cite{NHSinflation2023} of:
\begin{math} 1.0206 \times 1.0130 \times 1.0159 \times 1.0130 \times 1.0084 \times 1.0170 \times 1.0634 \end{math}.


\begin{landscape}
\begin{table}[h!]
\centering
    \caption{MI and stroke costs from the UK NHS 2022/23 cost schedule}
	\hspace*{-2cm}
    \label{MISTUKcost}
\fontsize{6pt}{10pt}\selectfont\begin{tabular}{llllll}
\hline
Outcome & Code & Description & Number & Unit cost (\textsterling) & Weighted mean (\textsterling) \\
\hline
\multirow{5}{*}{MI} &
EB10A & Actual or Suspected Myocardial Infarction, with CC Score 13+ & 25,923 & 3,480 \\
& EB10B & Actual or Suspected Myocardial Infarction, with CC Score 10-12 & 23,854 & 2,444 \\
& EB10C & Actual or Suspected Myocardial Infarction, with CC Score 7-9 & 25,115 & 1,931 & 2,212 \\
& EB10D & Actual or Suspected Myocardial Infarction, with CC Score 4-6 & 26,344 & 1,654 \\
& EB10E & Actual or Suspected Myocardial Infarction, with CC Score 0-3 & 19,668 & 1,367 \\
\hline
\multirow{15}{*}{Stroke} &
AA22C & Cerebrovascular Accident, Nervous System Infections or Encephalopathy, with CC Score 14+ & 6,986 & 6,114 \\
& AA22D & Cerebrovascular Accident, Nervous System Infections or Encephalopathy, with CC Score 11-13 & 3,892 & 3,603 \\
& AA22E & Cerebrovascular Accident, Nervous System Infections or Encephalopathy, with CC Score 8-10 & 4,155 & 3,067 \\
& AA22F & Cerebrovascular Accident, Nervous System Infections or Encephalopathy, with CC Score 5-7 & 4,763 & 2,467 \\
& AA22G & Cerebrovascular Accident, Nervous System Infections or Encephalopathy, with CC Score 0-4 & 7,700 & 1,709 \\
& AA23C & Haemorrhagic Cerebrovascular Disorders with CC Score 14+ & 3,280 & 6,467 \\
& AA23D & Haemorrhagic Cerebrovascular Disorders with CC Score 10-13 & 2,729 & 3,977 \\
& AA23E & Haemorrhagic Cerebrovascular Disorders with CC Score 6-9 & 3,057 & 3,127 & 4,626 \\
& AA23F & Haemorrhagic Cerebrovascular Disorders with CC Score 3-5 & 2,325 & 2,438 \\
& AA23G & Haemorrhagic Cerebrovascular Disorders with CC Score 0-2 & 1,606 & 2,106 \\
& AA35A & Stroke with CC Score 16+ & 46,703 & 7,966 \\
& AA35B & Stroke with CC Score 13-15 & 32,766 & 5,543 \\
& AA35C & Stroke with CC Score 10-12 & 32,060 & 4,156 \\
& AA35D & Stroke with CC Score 7-9 & 28,766 & 3,067 \\
& AA35E & Stroke with CC Score 4-6 & 22,176 & 2,395 \\
& AA35F & Stroke with CC Score 0-3 & 12,894 & 1,836 \\
\hline
\end{tabular}
\end{table}
\end{landscape}

\clearpage
\subsubsection{Societal perspective}

We will also estimate the cost-effectiveness in these models
using a societal perspective. For this, we will use the human capital approach \cite{VanARD2010}.
This includes costs attributable to lost earnings due to absenteeism (acute and chronic),
workforce dropout due to CVD, and loss of future earnings due to premature mortality. 
All indirect costs can be calculated by multiplying lost work time by the mean earnings, adjusted
for workforce participation and unemployment. The inputs for this are as follows:

\begin{itemize}
\item Retirement age was set at 67 years in Australia and 66 years in the UK, as the current state pension ages. 
\item Average annual earnings were set at \$73,003 in Australia, derived from the 
Australia Bureau of Statistics (\$1399.70 per week in May 2023; (\begin{math}
1399.10 \times \frac{365.25}{7} = 73,003 \end{math}) \cite{ABSWeeklyEarnings}; and 
\textsterling 34,855 in the UK
derived from the average weekly total earnings from the 
Office for National Statistics in the UK (\textsterling 668 per week in June 2023; (\begin{math}
668 \times \frac{365.25}{7} = 34,855 \end{math}) \cite{ONSWeeklyEarnings}.
\item Sex and age-specific employment rates (defined as the proportion
of people actually in employment, thereby accounting for both workforce participation
and unemployment), derived from the Australian Bureau of Statistics for Australia (for June 2023 \cite{ABSEmployment})
with the values shown in Table~\ref{ABSemployment}; and the Office for
National Statistics in the UK (From May-July 2022 \cite{ONSEmployment}), set at:
\begin{itemize}
\item Females, 40-49: 80.6\%
\item Females, 50-65: 65.9\%
\item Males, 40-49: 90.0\%
\item Males, 50-65: 74.3\%
\end{itemize}
\item The acute absenteeism period for MI, set at 55 days, which was derived
from a cohort study of individuals admitted for acute coronary syndrome or for 
coronary artery bypass graft surgery (from mean time to return to work of 7.89 weeks
for people with acute coronary syndrome) \cite{WorcHLC2014}. 
\item The acute absenteeism period for stroke, set at 90 days, which was derived
from a retrospective analysis of clinical trial data on stroke survivors \cite{RadfordJRM2020}. 
\item The chronic absenteeism for CVD (MI or stroke), set at 21.5 days annually, based on
a large study in the US \cite{SongBMC2015} (calculated from year 1 in table 5,
where people with CVD had 35.0 absent hours and (matched-cohort) people without had 21.4:
\begin{math} (35.0-21.4) \times \frac{12}{7.6} = 21.5 \end{math}). 
\item The chronic absenteeism for diabetes, set at 6 days annually, based on a systematic review
of absenteeism studies; 6 was the mid-point value for the range provided in the study (2-10) \cite{BretonDC2013}.
\item Workforce participation among people with MI, calculated using the prevalence ratio for not being
in the workforce of 1.46 (95\%CI: 1.36, 1.55), which was derived from a large Australian 
cross-sectional study \cite{BinPlos2021}. 
\item Workforce participation among people with stroke, calculated using the prevalence ratio for not being
in the workforce of 1.92 (95\%CI: 1.80, 2.06), which was derived from the same study as MI \cite{BinPlos2021}.
\item Workforce participation among people with diabetes, calculated as an absolute reduction
in the probability of being in the labour force (but it will be applied to the employment rate),
derived from an Australian study \cite{ZhangJHE2009}, set at:
\begin{itemize}
\item Females, 40-49: -3.7\%
\item Females, 50-65: -0.2\%
\item Males, 40-49: -3.9\%
\item Males, 50-65: -11.5\%
\end{itemize}
\end{itemize}

\begin{table}[h!]
\centering
    \caption{Employment, workforce participation, and unemployment by age and sex in Australia. Workforce participation and unemployment were 
derived from the Australian Bureau of Statistics \cite{ABSEmployment} and employment was calculated based on these numbers.}
    \label{ABSemployment}
	\begin{tabular}{lllll}
\hline
Sex & Age & Employment & Workforce participation & Unemployment \\
\hline
\multirow{7}{*}{Females}
& 15-24 & 67.3\% & 72.3\% & 6.9\% \\
& 25-34 & 79.2\% & 81.4\% & 2.7\% \\
& 35-44 & 80.1\% & 82.5\% & 2.9\% \\
& 45-54 & 80.1\% & 82.3\% & 2.7\% \\
& 55-66* & 62.2\% & 64.1\% & 2.9\% \\
\multirow{7}{*}{Males}
& 15-24 & 64.6\% & 70.4\% & 8.2\% \\
& 25-34 & 87.0\% & 89.8\% & 3.1\% \\
& 35-44 & 89.0\% & 91.1\% & 2.3\% \\
& 45-54 & 86.5\% & 88.9\% & 2.7\% \\
& 55-66* & 72.5\% & 74.7\% & 3.0\% \\
\hline
\end{tabular} \\
*Uses estimates from 55-64 but extrapolates to 65-66 (as opposed to using 65 years and above)
\end{table}


\clearpage
\subsection{Summary}

A summary of the inputs to this model are shown in Tables~\ref{heaegtab1}-~\ref{heaegtabc}.
The discounting rate in the primary analysis will be 5.0\% in Australia, as recommended by Australian
guidelines \cite{PBACG}; and
3.5\% in the UK, as recommended by UK guidelines \cite{NICEHTA2013}.
The primary outcomes will be the incremental cost-effectiveness ratio (ICER) 
for each intervention compared to control, which will be compared to the willingness-to-pay thresholds of each country. 
These are \$28,000 per QALY gained in Australia \cite{EdneyPHEC2018} and \textsterling 20,000 to \textsterling 30,000 per QALY in the UK \cite{NICEHTA2013}. 

\begin{landscape}
\thispagestyle{empty}
\begin{table}[h!]
\centering
    \caption{Model inputs -- epidemiological}
	\hspace*{-2cm}
    \label{heaegtab1}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{llll}
\hline
Input & Value & Distribution & Source \\
\hline
Transition probabilities & See Section~\ref{TPsec} & Log-normal & UK Biobank and \cite{PalBMJODRC2021} \\
Risk factor levels & See Section~\ref{rftrajsec} & Normal and log-normal & UK Biobank \\
LDL-C on incident MI & 2.083 (2.000, 2.222) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{FerenceJAMA2019} \\
Lp(a) on incident MI & 1.0054 (1.0045, 1.0062) per 1 mg/dL increase in lifetime Lp(a) & Log-normal & \cite{LaminaJAMAC2019} \\
SBP on incident MI & 1.058 (1.051, 1.064) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{FerenceJAMA2019} \\
Smoking on incident MI & 1.43 (1.22, 1.62) per 1 unit increase in the LSI & Log-normal & \cite{LevinJAMANO2021} \\
Diabetes on incident MI & 1.26 (1.08, 1.40) for diabetes vs. no diabetes & Log-normal & \cite{RossEHJ2015} \\
LDL-C on incident IS & 1.08 (1.03, 1.14) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{YuanAN2020} \\
Lp(a) on incident IS & 1.0035 (1.0023, 1.0045) per 1 mg/dL increase in lifetime Lp(a) & Log-normal & \cite{LarssonCirc2020} \\
SBP on incident IS & 1.027 (1.018, 1.037) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{WanHyp2021} \\
Smoking on incident IS & 1.33 (1.22, 1.46) per 1 unit increase in the LSI & Log-normal & \cite{LarssonAN2019} \\
Type 2 diabetes on incident IS & 1.74 (1.19, 2.47) for diabetes vs. no diabetes & Log-normal & \cite{GanDC2019} \\
SBP on incidence ICH & 1.039 (1.010, 1.069) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{WanHyp2021} \\
LDL-C on incident type 2 diabetes* & 0.763 (0.645, 0.909) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{LottaJAMA2016} \\
Smoking on incident type 2 diabetes & 1.21 (1.03, 1.41) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from bladder cancer & 2.52 (1.66, 3.81) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from colorectal cancer & 1.24 (1.06, 1.44) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from oesophageal cancer & 3.67 (1.67, 8.02) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from kidney cancer & 1.69 (1.04, 3.05) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from lung cancer & 13.64 (8.85, 21.03) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from ovarian cancer & 1.27 (1.04, 1.57) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from pancreatic cancer & 2.13 (1.15, 3.90) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
SBP on death from Pneumonia & 1.016 (1.008, 1.025) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{ZekavatMed2021} \\
Smoking on death from Pneumonia & 4.03 (3.16, 5.11) per 1 unit increase in the LSI & Log-normal & \cite{FlatbyCMI2022} \\
Smoking on death from COPD & 13.64 (8.85, 21.03) per 1 unit increase in the LSI & Log-normal & Inferred based on \cite{LarssonEBM2022,KingECM2020} \\
LDL-C on death from ALS & 1.09 (1.03, 1.14) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{ZengHMG2019} \\
Smoking on death from Parkinson's disease & 0.48 (0.27, 1.01) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Effect of atorvastatin 80 mg & 51.7\% (51.2, 52.2) LDL-C reduction & Normal & \cite{AdamsCDSR2015} \\
Effect of losartan 100 mg, chlortalidone 25 mg, and amlodipine 10 mg & 20 mmHg ($\pm$ 25\%) SBP reduction & Normal & \cite{SPRINT2015} \\
Effect of Olpasiran 225 mg & 97.5\% (94.0, 100.0) Lp(a) reduction & Beta & \cite{ODONEJM2022} \\
\hline
\end{tabular}
*Scenario analysis only. \\
Abbreviations: 
LDL-C -- Low-density lipoprotein-cholesterol; 
MI -- Myocardial infarction; 
SBP -- Systolic blood pressure; 
Lp(a) -- Lipoprotein(a);
IS -- Ischaemic stroke;
ICH -- Intracerebral haemorrhage;
COPD -- chronic obstructive pulmonary disease;
ALS -- amyotrophic lateral sclerosis.
\end{table}

\clearpage
\thispagestyle{empty}
\begin{table}[h!]
\centering
    \caption{Model inputs -- utilities}
	\hspace*{-2cm}
    \label{heaegtabu}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{lllll}
\hline
Category & Input & Value & Distribution & Source \\
\hline
\multirow{10}{*}{Utilities}
& Utility for no CVD or diabetes in Australia & Age and sex-specific (see Figure~\ref{AgeUT}) & Beta & \cite{McCaffreyHQLO2016} \\
& Utility for no CVD or diabetes in the UK & Age and sex-specific ($\pm$ 5\%; see Figure~\ref{AgeUTUK}) & Beta & \cite{ARAVIH2010} \\
& Chronic utility for diabetes & 0.785 (0.681, 0.889) & Beta & \cite{BeaudetVIH2014} \\
& Chronic utility for MI & 0.79 (0.73, 0.85) & Beta & \cite{BettsHQLO2020} \\
& Chronic utility for stroke &  0.65 (0.63, 0.67) & Beta & \cite{JoundiJAHA2022} \\
& Chronic utility for MI and stroke &  0.65 (0.63, 0.67) & Beta & \cite{JoundiJAHA2022} \\
& Chronic disutility for MI in diabetes & -0.055 (-0.067, -0.042) & Normal & \cite{BeaudetVIH2014} \\
& Chronic disutility for stroke in diabetes & -0.164 (-0.222, -0.105) & Normal & \cite{BeaudetVIH2014} \\
& Chronic disutility for MI and stroke in diabetes & -0.164 (-0.222, -0.105) & Normal & \cite{BeaudetVIH2014} \\
& Acute disutility for MI & -0.01125 ($\pm$ 20\%) & Normal & \cite{LaceyEJCN2004} \\
& Acute disutility for stroke & -0.03 ($\pm$ 20\%) & Normal & \cite{JoundiJAHA2022} \\
\hline
\end{tabular} \\
Abbreviations: 
MI -- Myocardial infarction.
\end{table}

\clearpage
\thispagestyle{empty}
\begin{table}[h!]
\centering
	\vspace*{-2cm}
    \caption{Model inputs -- costs}
	\hspace*{-3cm}
    \label{heaegtabc}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{lllll}
\hline
Category & Input & Value & Distribution & Source \\
\hline
\multirow{17}{*}{\specialcell{Direct healthcare costs -- \\ Australia}} 
& Chronic cost of diabetes & \$3,588 (2,816, 4539) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Chronic cost of MI & \$6,222 ($\pm$10\%) & Gamma & \cite{MarquinaEJPC2022,CobiacBMCPH2012} \\
& Chronic cost of stroke & \$4,388 ($\pm$10\%) & Gamma & \cite{MarquinaEJPC2022,CobiacBMCPH2012} \\
& Chronic cost of MI and stroke & \$6,222 ($\pm$10\%) & Gamma & \cite{MarquinaEJPC2022,CobiacBMCPH2012} \\
& Chronic cost of MI among people with diabetes & \$8,870 (6,804, 10,937) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Chronic cost of stroke among people with diabetes & \$8,870 (6,804; 10,937) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Chronic cost of MI and stroke among people with diabetes & \$8,870 (6,804; 10,937) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Acute cost of non-fatal MI & \$14,434 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Acute cost of non-fatal stroke & \$15,659 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Acute cost of fatal MI & \$3,363 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Acute cost of fatal stroke & \$13,154 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Lp(a) test cost & \$25 & Fixed & Current cost \\
& Annual cost of atorvastatin 80 mg & \$200 & Fixed & \cite{PBSDOS23} \\
& Annual cost of losartan 100 mg & \$200 & Fixed & \cite{PBSDOS23} \\
& Annual cost of chlortalidone 25 mg & \$143 & Fixed & \cite{PBSDOS23} \\
& Annual cost of amlodipine 10 mg & \$212 & Fixed & \cite{PBSDOS23} \\
& Annual cost of olpasiran 225 mg & \$4,360 & Fixed & Assumption \\
\hline
\multirow{17}{*}{Direct healthcare costs -- UK} 
& Chronic cost of diabetes & \textsterling 2,546 (2,462, 2,633) in females; 
\textsterling 2,170 (2,090, 2,254) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI & \textsterling 3,304 (3,026, 3,607) in females; 
\textsterling 2,917 (2,701, 3,149) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of stroke & \textsterling 7,021 (5,852, 8,421) in females; 
\textsterling 7,351 (5,923, 8,062) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI and stroke & \textsterling 14,442 (9,929, 21,004) in females; 
\textsterling 12,616 (8,484, 18,756) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI in diabetes & \textsterling 4,511 (3,947, 5,155) in females; 
\textsterling 3,917 (3,480, 4,409) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of stroke in diabetes & \textsterling 10,014 (7,615, 13,167) in females; 
\textsterling 10,494 (7,701, 14,300) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI and stroke in diabetes & \textsterling 14,442 (9,929, 21,004) in females; 
\textsterling 12,616 (8,484, 18,756) in males & Gamma & \cite{PHEcosts2020} \\
& Acute cost of non-fatal MI & \textsterling 2,212 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Acute cost of non-fatal stroke & \textsterling 4,626 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Acute cost of fatal MI & \textsterling 515 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Acute cost of fatal stroke & \textsterling 3,886 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Lp(a) test cost & \textsterling 40 & Fixed & Assumption \\
& Annual cost of atorvastatin 80 mg & \textsterling 18.00 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of losartan 100 mg & \textsterling 15.91 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of chlortalidone 25 mg & \textsterling 12.42 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of amlodipine 10 mg & \textsterling 9.91 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of olpasiran 225 mg & \textsterling 3,975 & Fixed & Assumption \\
\hline
\multirow{12}{*}{Indirect cost inputs} 
& Retirement age  -- Australia & 67 years & Fixed & Policy \\
& Retirement age  -- UK & 66 years & Fixed & Policy \\
& Average annual earnings -- Australia & \$73,003 & Fixed & \cite{ABSWeeklyEarnings} \\
& Average annual earnings -- UK & \textsterling 34,855 & Fixed & \cite{ONSWeeklyEarnings} \\
& Employment rates & Age and sex-specific & Fixed & \cite{ABSEmployment,ONSEmployment} \\
& Acute absenteeism for MI & 55 days ($\pm$20\%) & Normal & \cite{WorcHLC2014} \\
& Acute absenteeism for stroke & 90 days ($\pm$20\%) & Normal & \cite{RadfordJRM2020} \\
& Chronic absenteeism for CVD & 21.5 days annually ($\pm$20\%) & Normal & \cite{AIHWCDPW} \\
& Chronic absenteeism for diabetes & 6 days annually (2-10) & Normal & \cite{BretonDC2013} \\
& Workforce non-participation ratio for MI & 1.46 (1.36, 1.55) & Log-normal & \cite{BinPlos2021} \\
& Workforce non-participation ratio for stroke & 1.92 (1.80, 2.06) & Log-normal & \cite{BinPlos2021} \\
& Workforce non-participation reduction for diabetes & Age and sex-specific & Fixed & \cite{ZhangJHE2009} \\
\hline
\end{tabular}
Abbreviations: 
MI -- Myocardial infarction.
\end{table}
\end{landscape}



\clearpage
\section{UK Biobank data cleaning}
\label{TPsec}

Before estimation of the transition probabilities or risk factor trajectories, data cleaning is required. 

\subsection{Variables}

The UK Biobank main dataset variables of interest for this study are:
\begin{itemize}
\item Participant ID (UDI: eid)
\item Sex (UDI: 31)
\item Date of assessment (53)
\item UK Biobank assessment centre (54)
\item Year of birth (34)
\item Month of birth (52)
\item Date and causes of death (40000--40002)
\item Date and source of first myocardial infarction (MI) (42000--42001)
\item Date and source of first stroke (42006--42007)
\item Date and source of first IS (42008--42009)
\item Date and source of first ICH (42010--42011)
\item Diabetes diagnosed by doctor (2443)
\item Age diabetes diagnosed (2976)
\item Gestational diabetes only (4041)
\item Medication for cholesterol, blood pressure, diabetes (6153 (females) \& 6177 (males))
\item Treatment/medications (20003)
\item LDL-C (30780)
\item Lp(a) and reportability (30790 \& 30796)
\item SBP, manual reading (93) 
\item SBP, automatic reading (4079)
\item Current tobacco smoking (1239)
\item Past tobacco smoking (1249)
\item Age started smoking in current smokers (3436)
\item Age started smoking in former smokers (2867)
\item Age stopped smoking (2897)
\item Number of cigarettes currently smoked daily (3456)
\item Number of cigarettes previously smoked daily (2887)
\item Type of tobacco currently smoked (3446)
\item Type of tobacco previously smoked (2877)
\item Smoking compared to 10 years previous (3506)
\item Pack years of smoking (20161)
\end{itemize}

(Note that we include results from the first assessment only -- follow-up
is incomplete for all other assessments.)

From HESIN (hospital episode statistics for inpatients), we need the following fields:

\begin{itemize}
\item eid
\item Instance index (unique identifier for a record)
\item Inpatient record origin (England, Wales, or Scotland)
\item Inpatient record format
\item Episode start date
\item Episode end date
\item Episode status (has the episode finished)
\item Episode order
\item Spell index
\item Spell sequence
\item Date of admission to hospital
\item Sources of admission to hospital (recoded)
\item Date of discharge from hospital
\item Destination on discharge from hospital (recoded)
\end{itemize}

And from HESIN\textunderscore DIAG, we need:

\begin{itemize}
\item eid
\item Instance index (correpsonds to the unique identifier for a record in HESIN)
\item Array index (unique identifier for a diagnosis)
\item Classification of diagnosis (i.e., primary, secondary, or external)
\item Diagnoses (ICD-10)
\end{itemize}

\color{Blue4}
***/

texdoc stlog, nolog nodo
*	21000-0.0 Ethnic background
*Codes: https://biobank.ndph.ox.ac.uk/showcase/coding.cgi?id=1001
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(8874:8874)
cd /home/jed/Documents/LPA
save ethnicitiesmate
ta v1
texdoc stlog close

texdoc stlog, cmdlog nodo
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1:1)
save DS_1, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(7:7)
rename v1 sex
save DS_2, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(74:81)
rename (v1 v5) (da1 ac1)
keep da1 ac1
save DS_3, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(8:8)
rename v1 yob
save DS_4, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(73:73)
rename v1 mob
save DS_5, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(11680:11684)
rename (v1 v2 v3 v4 v5) (dod1 dod2 ucod ucod2 ccod1)
save DS_6, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(13731:13732)
rename (v1 v2) (midate misource)
save DS_7, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(13737:13742)
rename (v1 v2 v3 v4 v5 v6) (stdate stsource isdate issource ichdate ichsource)
save DS_8, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1030:1030)
rename (v1) (dmdoc1)
save DS_9, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1178:1178)
rename (v1) (agedmdx1)
save DS_10, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1520:1520)
rename (v1) (gdmonly1)
save DS_11, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(6070:6073)
forval i = 1/4 {
rename v`i' fmeduse`i'
}
save DS_12, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(6270:6272)
forval i = 1/3 {
rename v`i' mmeduse`i'
}
save DS_13, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(6641:6688)
forval i = 1/48 {
rename v`i' med`i'
}
save DS_14, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(11510:11511)
rename (v1 v2) (ldl1 ldl2)
save DS_15, replace


*Needs to be updated with new field

import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(11524:11525)
rename (v1 v2) (lpa1 lpa2)
save DS_16, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(11536:11537)
rename (v1 v2) (lpar1 lpar2)
save DS_17, replace

*Needs to be updated with new field


import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(376:377)
rename (v1 v2) (msbp00 msbp01)
save DS_18, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1540:1541)
rename (v1 v2) (asbp00 asbp01)
save DS_19, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(631:631)
rename (v1) (cs1)
save DS_20, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(635:635)
rename (v1) (ps1)
save DS_21, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1349:1349)
rename v1 agestartsmokecur1
save DS_22, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1142:1142)
rename v1 agestartsmokeprev1
save DS_23, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1154:1154)
rename v1 agestopsmoke1
save DS_24, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1357:1357)
rename v1 ncigcur1
save DS_25, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1150:1150)
rename v1 ncigprev1
save DS_26, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1353:1353)
rename v1 typetobcur1
save DS_27, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1146:1146)
rename v1 typetobprev1
save DS_28, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(1365:1365)
rename v1 delta10smoke1
save DS_29, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(8677:8677)
rename v1 packyear1
save DS_30, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(11470:11470)
destring v1, replace
gen a1c = 0.0915*v1+2.15
drop v1
save DS_31, replace
import delimited "/home/jed/Documents/ukb669154.csv", clear varnames(1) colrange(11482:11483)
rename (v1 v2) (hdl1 hdl2)
save DS_32, replace
use DS_1, clear
forval i = 2/32 {
merge 1:1 _n using DS_`i', nogen
}
save DS_comb, replace
import delimited "/home/jed/Documents/w88775_2023-04-25.csv", clear
rename v1 eid
save eiddrop, replace
use DS_comb, clear
merge 1:1 eid using eiddrop, keep(1) nogen
save DS, replace
import delimited "/home/jed/Documents/hesin.txt", varnames(1) clear
keep eid ins_index dsource source epistart epiend epistat ///
epiorder spell_index spell_seq admidate admisorc_uni disdate disdest_uni
save HESIN, replace
import delimited "/home/jed/Documents/hesin_diag.txt", varnames(1) clear
keep eid ins_index arr_index level diag_icd10
save HESIN_DIAG, replace
texdoc stlog close

/***
\color{black}

\clearpage
\subsection{Main dataset}

I have previously checked and cleaned UK Biobank data in detail (e.g., \cite{MortonVIH2024},
so will not repeat the checks here. 

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
use DS, clear
destring sex, replace
label variable sex
gen da = date(da1,"YMD")
format da %td
gen ac = "England"
replace ac = "Wales" if ac1 == "11003" | ac1 == "11022" | ac1 == "11023"
replace ac = "Scotland" if ac1 == "11004" | ac1 == "11005"
set seed 19287
gen db = runiformint(1,28) if mob == "2"
replace db = runiformint(1,31) if mob == "1" | mob == "3" | mob == "5" | mob == "7" | mob == "8" | mob == "10" | mob == "12"
replace db = runiformint(1,30) if mob == "4" | mob == "6" | mob == "9" | mob == "11"
tostring db, replace
replace db = "0" + db if length(db)==1
replace mob = "0" + mob if length(mob)==1
gen dbb = db+mob+yob
gen dob = date(dbb,"DMY")
format dob %td
drop if dob==.
gen dod = date(dod1,"YMD")
format dod %td
label variable ucod
gen chddeath = 1 if inrange(ucod,"I21","I2599")
gen isdeath = 1 if substr(ucod,1,3)=="I63" | substr(ucod,1,3)=="I64"
gen ichdeath = 1 if substr(ucod,1,3)=="I61"
gen oescdeath = 1 if substr(ucod,1,3)=="C15"
gen colcdeath = 1 if inrange(ucod,"C18","C209")
gen pancdeath = 1 if substr(ucod,1,3)=="C25"
gen luncdeath = 1 if substr(ucod,1,3)=="C34"
gen ovacdeath = 1 if substr(ucod,1,3)=="C56"
gen kidcdeath = 1 if substr(ucod,1,3)=="C64"
gen blacdeath = 1 if substr(ucod,1,3)=="C67"
gen pneudeath = 1 if substr(ucod,1,3)=="J18"
gen copddeath = 1 if substr(ucod,1,3)=="J44"
gen alsdeath = 1 if ucod=="G122"
gen pddeath = 1 if substr(ucod,1,3)=="G20"
gen otherdeath = 1 if dod!=.
foreach var of varlist chddeath-pddeath {
replace otherdeath =. if `var' == 1
}
gen mid = date(midate, "YMD")
gen std = date(stdate, "YMD")
gen isd = date(isdate, "YMD")
gen ichd = date(ichdate, "YMD")
format mid-ichd %td
save midclean_1, replace
use HESIN_DIAG, clear
gen MI = 1 if inrange(diag,"I21","I238") | diag == "I241" | diag == "I252"
gen ST = 1 if inrange(diag,"I60","I619") | inrange(diag,"I63","I649")
gen IS = 1 if inrange(diag,"I63","I6499")
gen ICH = 1 if inrange(diag,"I61","I6199")
keep if MI == 1 | ST == 1 | IS == 1 | ICH == 1
save HESINevents, replace
use HESIN, clear
merge 1:m eid ins_index using HESINevents
keep if _merge == 3
drop _merge
gen admdate = date(epistart,"DMY")
replace admdate = date(admidate,"DMY") if admdate==.
format admdate %td
save HESINeventss, replace
foreach i in MI ST IS ICH {
use HESINeventss, clear
keep if `i' == 1
bysort eid (admdate level) : keep if _n == 1
keep eid diag level `i' admdate
save First`i'HESIN, replace
}
use midclean_1, clear
merge 1:1 eid using FirstMIHESIN, keep(1 3) nogen
replace mid = admdate if admdate < mid
drop level-admdate
merge 1:1 eid using FirstSTHESIN, keep(1 3) nogen
replace std = admdate if admdate < std
drop level-admdate
merge 1:1 eid using FirstISHESIN, keep(1 3) nogen
replace isd = admdate if admdate < isd
drop level-admdate
merge 1:1 eid using FirstICHHESIN, keep(1 3) nogen
replace ichd = admdate if admdate < ichd
drop level-admdate
save midclean_2, replace
*copy "/home/jed/Documents/WuESM1.dta" WuESM1.dta
*ESM1 from Wu et al. https://pubmed.ncbi.nlm.nih.gov/31015401/
use WuESM1, clear
forval i = 1/10 {
gen njm = _n
gen delim = strpos(medic,"|")
expand 2 if delim!=0
bysort njm : replace medic = substr(medic,1,delim-2) if _n==1 & _n!=_N
bysort njm : replace medic = substr(medic,delim+1,length(medic)) if _n > 1
drop njm delim
}
save WuESM1long, replace
use WuESM1long, clear
gen DM = 1 if substr(medic,1,3)=="A10"
keep if DM == 1
keep codinga DM
save DMdrugcodes, replace
use WuESM1long, clear
gen LL = 1 if substr(medic,1,5)=="C10AA" | medica == "C10AX09"
keep if LL == 1
keep codinga LL
save LLdrugcodes, replace
use WuESM1long, clear
gen HT = 1 if substr(medic,1,3)=="C03" | substr(medic,1,3)=="C07" | substr(medic,1,3)=="C08" | substr(medic,1,3)=="C09"
keep if HT == 1
keep codinga HT
save HTdrugcodes, replace
use DS, clear
keep eid med1-med48
gen med = med1
forval i = 2/48 {
bysort eid : gen njm = _n
bysort eid : gen Njm = _N
expand 2 if med`i'!="" & njm == Njm
bysort eid (njm) : replace med = med`i' if med`i' !="" & _n == _N
drop njm Njm
}
keep eid med
destring med, replace
rename med codinga
foreach i in DM LL HT {
merge m:1 codinga using `i'drugcodes
drop if _merge == 2
drop _merge
}
collapse (sum) DM-HT, by(eid)
replace DM = 1 if DM > 1
replace LL = 1 if LL > 1
save codedmeds, replace
use midclean_2, clear
drop med1-med48
merge 1:1 eid using codedmeds, keep(1 3) nogen
gen DMA = 1 if dmdoc1 == "1"
replace DMA = . if gdmonly1 == "1"
gen DMC = 1 if (DMA == 1 & DM == 1) | (a1c >=6.5 & a1c!=.) | (DMA == 1 & a1c==.)
*Diabetes if doctor told you confirmed by drugs/a1c, or a1c alone (missing a1c, defer to self report)
destring agedmdx1, replace
gen dmdxdate = round(dob+(agedmdx1*365.25),1) if DMA == 1 & agedmdx1 > 0
replace dmdxdate = da if DMA == 1 & dmdxdate==.
format dmdxdate %td
gen agedmdx = (dmdxdate-dob)/365.25
gen T1Dlikely = 1 if agedmdx < 20
destring ldl1 ldl2, replace
destring hdl1 hdl2, replace
destring lpa1 lpa2, replace
gen ldl = ldl1
replace ldl = ldl2 if ldl1==.
gen hdl = hdl1
replace hdl = hdl2 if hdl1==.
gen lpa = lpa1
replace lpa = lpa2 if lpa1==.
*Needs to be updated with new field
*Convert from nmol/L to mg/dL using https://pubmed.ncbi.nlm.nih.gov/30608559/
replace lpa = (lpa+3.83)/2.18
rename lpar1 lpar
label variable lpar
rename LL LLT
label variable LLT
gen sbp1 = asbp00
replace sbp1 = msbp00 if missing(asbp00)
gen sbp2 = asbp01
replace sbp2 = msbp01 if missing(asbp01)
destring sbp1 sbp2, replace
gen sbp = (sbp1+sbp2)/2
replace sbp = sbp1 if sbp2==.
replace sbp = sbp2 if sbp1==.
rename HT AHT
label variable AHT
gen eversmoke = 1 if cs1 == "1" | ps1 == "1"
recode eversmoke .=0
destring agestartsmokeprev1 agestartsmokecur1, replace
gen agess = min(agestartsmokeprev1,agestartsmokecur1)
su(agess) if agess > 0
replace agess = round(r(mean),1) if agess < 0
gen smkdate = round(dob+(agess*365.25),1)
format smkdate %td
destring agestopsmoke1, replace
rename agestopsmoke1 agests
replace agests= -2 if agests < agess & agests > 0
gen dursmk = agests-agess if agests > 0
replace agests = round(agess+r(mean),1) if agests < 0
drop dursmk
gen quitdate = round(dob+(agests*365.25),1)
replace agests = round((da-dob)/365.25,1) if quitdate>da & quitdate!=.
replace quitdate = da if quitdate>da & quitdate!=.
format quitdate %td
gen dursmkq = agests-agess
gen dursmkc = round((da-smkdate)/365.25,1) if quitdate==.
gen dursmk = min(dursmkq,dursmkc)
destring ncigprev1 ncigcur1, replace
gen ncig = min(ncigprev1,ncigcur1)
replace ncig=0.5 if ncig == -10
su(ncig)
replace ncig = round(r(mean),1) if eversmoke==1 & (ncig==. | ncig < 0)
gen tsc = 0 if quitdate==. & eversmoke==1
replace tsc = (da-quitdate)/365.25 if quitdate!=.
gen LSI = 0
replace LSI = (1-(0.5^(dursmk/18)))*(0.5^(tsc/18))*ln(ncig+1) if eversmoke==1
su LSI, detail
drop if dob==.
drop if T1Dlikely==1
***
**To be removed when get the new variable
set seed 29487
replace lpa = runiform(0.01,3.49) if lpar == "4"
replace lpa = rexponential(20)+88.5 if lpar == "5"
*****
save fullset, replace
drop if mid < da
drop if std < da
keep eid sex da ac dob dod ucod chddeath-otherdeath DMC ldl hdl LLT lpa lpar sbp AHT LSI dursmk tsc ncig
order eid sex da ac dob dod ucod chddeath-otherdeath DMC ldl LLT hdl lpa lpar sbp AHT LSI dursmk tsc ncig
save mainset, replace
erase midclean_1.dta
erase midclean_2.dta
texdoc stlog close


/***
\color{black}

\clearpage
\subsection{HESIN}

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
use HESIN_DIAG, clear
keep if level == 1
gen MI = 1 if inrange(diag,"I21","I229")
gen IS = 1 if inrange(diag,"I63","I6499")
gen ICH = 1 if inrange(diag,"I61","I6199")
keep if MI == 1 | IS == 1 | ICH == 1
save hesinmiisich, replace
use HESIN, clear
merge 1:m eid ins_index using hesinmiisich, nogen
gen event=min(MI,IS,ICH)
bysort eid : egen A = min(event)
keep if A == 1
drop A
gen epist = date(epistart,"DMY")
gen epien = date(epiend,"DMY")
format epist epien %td
sort eid epist epien
bysort eid (epist epien) : gen dist = epist-epien[_n-1]
replace epist = date(admidate,"DMY") if epist==.
replace epist = epien if missing(epist)
drop if epist==.
replace epien = date(disdate,"DMY") if epien==.
replace epien = epist if epien==.
gen admmode = 1
replace admmode = 0 if inrange(admisorc,1000,2002) | inrange(admisorc,4000,4001) ///
 | inrange(admisorc,7000,7003) | (admisorc >= 10000 & admisorc!=11000)
gen sepmode = 1
replace sepmode = 0 if inrange(disdest,1000,2002) | inrange(disdest,4000,4001) ///
 | inrange(disdest,7000,7003) | (disdest >= 10000 & disdest!=11000)
replace sepmode = 2 if disdest==11001
quietly {
forval i = 1/100 {
bysort eid (epist epien sepmode) : gen A = 1 if epist < epien[_n-1] & epien[_n-1]!=.
bysort eid (epist epien sepmode) : replace A =. if A[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epist = epist[_n+1] if epist[_n+1] < epist & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==1 & epien[_n+1] > epien & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==2 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epien = epien[_n+1] if epien[_n+1] > epien & A[_n+1]==1
drop if A == 1
drop A
}
forval i = 1/5 {
bysort eid (epist epien sepmode) : gen A = 1 if epist == epist[_n-1] & epien == epien[_n-1]
bysort eid (epist epien sepmode) : replace A =. if A[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]!=0 & A[_n+1]==1
drop if A == 1
drop A
}
}
quietly {
forval i = 1/100 {
bysort eid (epist epien sepmode) : gen A = 1 if epist < epien[_n-1] & epien[_n-1]!=.
bysort eid (epist epien sepmode) : replace A =. if A[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epist = epist[_n+1] if epist[_n+1] < epist & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==1 & epien[_n+1] > epien & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==2 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epien = epien[_n+1] if epien[_n+1] > epien & A[_n+1]==1
drop if A == 1
drop A
}
forval i = 1/5 {
bysort eid (epist epien sepmode) : gen A = 1 if epist == epist[_n-1] & epien == epien[_n-1]
bysort eid (epist epien sepmode) : replace A =. if A[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]!=0 & A[_n+1]==1
drop if A == 1
drop A
}
}
bysort eid (epist epien sepmode) : gen ptr = 1 if admmode==1 | sepmode[_n-1]==1
bysort eid (epist epien sepmode) : gen transferdist = epist-epien[_n-1]
gen tr = 1 if ptr == 1 & inrange(transferdist,0,1)
bysort eid (epist epien sepmode) : replace tr = 1 if transferdist==0 & (MI==1 | MI[_n-1]==1 | IS == 1 | IS[_n-1]==1 | ICH == 1 | ICH[_n-1]==1)
bysort eid (epist epien sepmode) : replace tr =. if tr[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace epien = epien[_n+1] if tr[_n+1]==1
bysort eid (epist epien sepmode) : drop if tr == 1 & tr[_n-1]==.
drop ptr tr transferdist
quietly {
forval i = 1/100 {
bysort eid (epist epien sepmode) : gen ptr = 1 if admmode==1 | sepmode[_n-1]==1
bysort eid (epist epien sepmode) : gen transferdist = epist-epien[_n-1]
gen tr = 1 if ptr == 1 & inrange(transferdist,0,1)
bysort eid (epist epien sepmode) : replace tr = 1 if transferdist==0 & (MI==1 | MI[_n-1]==1 | IS == 1 | IS[_n-1]==1 | ICH == 1 | ICH[_n-1]==1)
bysort eid (epist epien sepmode) : replace tr =. if tr[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace epien = epien[_n+1] if tr[_n+1]==1
bysort eid (epist epien sepmode) : drop if tr == 1 & tr[_n-1]==.
drop ptr tr transferdist
bysort eid (epist epien sepmode) : gen A = 1 if epist < epien[_n-1] & epien[_n-1]!=.
bysort eid (epist epien sepmode) : replace A =. if A[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epist = epist[_n+1] if epist[_n+1] < epist & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==1 & epien[_n+1] > epien & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==2 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epien = epien[_n+1] if epien[_n+1] > epien & A[_n+1]==1
drop if A == 1
drop A
}
}
preserve
keep if MI == 1
keep eid MI epist epien 
save AllMI, replace
restore
preserve
keep if IS == 1
keep eid IS epist epien 
save AllIS, replace
restore
keep if ICH == 1
keep eid ICH epist epien 
save AllICH, replace
use HESIN_DIAG, clear
gen MI = 1 if inrange(diag,"I21","I238") | diag == "I241" | diag == "I252"
keep if MI == 1
bysort eid ins_index : keep if _n == 1
keep eid ins_index MI
save hesinmi, replace
use HESIN_DIAG, clear
gen IS = 1 if inrange(diag,"I63","I6499")
keep if IS == 1
bysort eid ins_index : keep if _n == 1
keep eid ins_index IS
save hesinis, replace
use HESIN_DIAG, clear
gen ICH = 1 if inrange(diag,"I61","I6199")
keep if ICH == 1
bysort eid ins_index : keep if _n == 1
keep eid ins_index ICH
save hesinich, replace
use hesinmi, clear
merge 1:1 eid ins_index using hesinis, nogen
merge 1:1 eid ins_index using hesinich, nogen
sort eid ins
save hesinmiisichfirst, replace
use HESIN, clear
merge 1:m eid ins_index using hesinmiisichfirst, nogen
gen event=min(MI,IS,ICH)
bysort eid : egen A = min(event)
keep if A == 1
drop A
gen epist = date(epistart,"DMY")
gen epien = date(epiend,"DMY")
format epist epien %td
sort eid epist epien
replace epist = date(admidate,"DMY") if epist==.
replace epist = epien if missing(epist)
drop if epist==.
replace epien = date(disdate,"DMY") if epien==.
replace epien = epist if epien==.
gen admmode = 1
replace admmode = 0 if inrange(admisorc,1000,2002) | inrange(admisorc,4000,4001) ///
 | inrange(admisorc,7000,7003) | (admisorc >= 10000 & admisorc!=11000)
gen sepmode = 1
replace sepmode = 0 if inrange(disdest,1000,2002) | inrange(disdest,4000,4001) ///
 | inrange(disdest,7000,7003) | (disdest >= 10000 & disdest!=11000)
replace sepmode = 2 if disdest==11001
quietly {
forval i = 1/100 {
bysort eid (epist epien sepmode) : gen A = 1 if epist < epien[_n-1] & epien[_n-1]!=.
bysort eid (epist epien sepmode) : replace A =. if A[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epist = epist[_n+1] if epist[_n+1] < epist & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==1 & epien[_n+1] > epien & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==2 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epien = epien[_n+1] if epien[_n+1] > epien & A[_n+1]==1
drop if A == 1
drop A
}
forval i = 1/5 {
bysort eid (epist epien sepmode) : gen A = 1 if epist == epist[_n-1] & epien == epien[_n-1]
bysort eid (epist epien sepmode) : replace A =. if A[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]!=0 & A[_n+1]==1
drop if A == 1
drop A
}
}
bysort eid (epist epien sepmode) : gen ptr = 1 if admmode==1 | sepmode[_n-1]==1
bysort eid (epist epien sepmode) : gen transferdist = epist-epien[_n-1]
gen tr = 1 if ptr == 1 & inrange(transferdist,0,1)
bysort eid (epist epien sepmode) : replace tr = 1 if transferdist==0 & (MI==1 | MI[_n-1]==1 | IS == 1 | IS[_n-1]==1 | ICH == 1 | ICH[_n-1]==1)
bysort eid (epist epien sepmode) : replace tr =. if tr[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace epien = epien[_n+1] if tr[_n+1]==1
bysort eid (epist epien sepmode) : drop if tr == 1 & tr[_n-1]==.
drop ptr tr transferdist
quietly {
forval i = 1/100 {
bysort eid (epist epien sepmode) : gen ptr = 1 if admmode==1 | sepmode[_n-1]==1
bysort eid (epist epien sepmode) : gen transferdist = epist-epien[_n-1]
gen tr = 1 if ptr == 1 & inrange(transferdist,0,1)
bysort eid (epist epien sepmode) : replace tr = 1 if transferdist==0 & (MI==1 | MI[_n-1]==1 | IS == 1 | IS[_n-1]==1 | ICH == 1 | ICH[_n-1]==1)
bysort eid (epist epien sepmode) : replace tr =. if tr[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & tr[_n+1]==1
bysort eid (epist epien sepmode) : replace epien = epien[_n+1] if tr[_n+1]==1
bysort eid (epist epien sepmode) : drop if tr == 1 & tr[_n-1]==.
drop ptr tr transferdist
bysort eid (epist epien sepmode) : gen A = 1 if epist < epien[_n-1] & epien[_n-1]!=.
bysort eid (epist epien sepmode) : replace A =. if A[_n-1]==1
bysort eid (epist epien sepmode) : replace MI = 1 if MI[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace IS = 1 if IS[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace ICH = 1 if ICH[_n+1]==1 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epist = epist[_n+1] if epist[_n+1] < epist & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==1 & epien[_n+1] > epien & A[_n+1]==1
bysort eid (epist epien sepmode) : replace sepmode = sepmode[_n+1] if sepmode[_n+1]==2 & A[_n+1]==1
bysort eid (epist epien sepmode) : replace epien = epien[_n+1] if epien[_n+1] > epien & A[_n+1]==1
drop if A == 1
drop A
}
}
preserve
keep if MI == 1
keep eid MI epist epien 
bysort eid (epist) : keep if _n == 1
save FirstMI, replace
restore
preserve
keep if IS == 1
keep eid IS epist epien
bysort eid (epist) : keep if _n == 1
save FirstIS, replace
restore
keep if ICH == 1
keep eid ICH epist epien 
bysort eid (epist) : keep if _n == 1
save FirstICH, replace
use mainset, clear
keep eid
save includedeid, replace
foreach i in MI IS ICH {
use All`i', clear
merge 1:1 eid epist epien using First`i', nogen
merge m:1 eid using includedeid, keep(3) nogen
save All_`i', replace
}
texdoc stlog close

use mainset, clear
foreach var of varlist _all {
count if missing(`var')==0
texdoc local `var'1 = r(N)
}

/***
\color{black}

\clearpage
\subsection{Summary and population characteristics}
\label{cleansum}

In this section, we cleaned the UK Biobank main and HESIN datasets, creating
the datasets: \emph{mainset, All\textunderscore MI, All\textunderscore IS,} and \emph{All\textunderscore ICH}. 
The main dataset (\emph{mainset}) includes all individuals with available information on date of birth, 
who were not diagnosed with diabetes before age 20 years (i.e., likely type 1 diabetes), 
and who were free of MI and stroke at baseline (N=`eid1'). 

The event datasets (\emph{All\textunderscore MI, All\textunderscore IS,} and \emph{All\textunderscore ICH}) 
included all events available in the HESIN datasets,
which were defined as follows:
\begin{itemize}
\item First MI: presence of the ICD-10 codes I21-I238, I241, or I252 as any diagnosis for an admission. 
\item Repeat MI: presence of the ICD-10 codes I21-I22 as the primary diagnosis for an admission.
\item First IS: presence of the ICD-10 codes I63-I64 as any diagnosis for an admission
\item Repeat IS: presence of the ICD-10 codes I63-64 as the primary diagnosis for an admission.
\item First ICH: presence of the ICD-10 code I61 as any diagnosis for an admission
\item Repeat ICH: presence of the ICD-10 code I61 as the primary diagnosis for an admission.
\end{itemize}

Population characteristics are shown in Table~\ref{popchartable}. 

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
*mkdir CSV
forval s = 0/2 {
use mainset, clear
drop if sex == `s'
count
matrix A = (r(N),.,.,.,.)
gen ageda = (da-dob)/365.25
su age, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
count if DMC!=.
matrix A = (A\r(N),.,.,.,.)
su ldl, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
su lpa, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
su sbp, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
su LSI, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
mat A`s' = (J(7,1,`s'),A)
}
mat A = (A0\A1\A2)
clear
svmat double A
gen njm = _n
bysort A1 (njm) : gen perc = 100*A2/A2[_n-2] if _n == 3
forval i = 2/6 {
bysort A1 (njm) : replace A`i' = (A`i'*2.18)-3.83 if _n == 5
replace A`i' = 0 if A`i'<0
}
tostring A2-A6, gen(B2 B3 B4 B5 B6) format(%9.0fc) force
tostring A2 A3 A4 A5 A6 perc, replace format(%9.1f) force
bysort A1 (njm) : gen A = B2 if _n == 1
bysort A1 (njm) : replace A = B2 + " (" + perc + "\%)" if _n == 3
bysort A1 (njm) : replace A = B4 + " (" + B3 + ", " + B5 + "; " + B2 + ", " + B6 + ")" if _n == 2 | _n == 6
bysort A1 (njm) : replace A = A4 + " (" + A3 + ", " + A5 + "; " + A2 + ", " + A6 + ")" if A==""
bysort A1 (njm) : gen row = _n
keep A1 A row
reshape wide A, j(A1) i(row)
drop row
gen R1 = "N" if _n == 1
replace R1 = "Age" if _n == 2
replace R1 = "N (\%) with diabetes" if _n == 3
replace R1 = "LDL-C (mmol/L)" if _n == 4
replace R1 = "Lp(a) (nmol/L)" if _n == 5
replace R1 = "SBP (mmHg)" if _n == 6
replace R1 = "LSI" if _n == 7
order R1 A1 A0 A2
export delimited using CSV/popchar.csv, delimiter(":") novarnames replace
texdoc stlog close

/***
\color{black}

\begin{table}[h!]
  \begin{center}
    \caption{Baseline characteristics for the UK Biobank sample}
    \label{popchartable}
    \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=, column type={l}, text indicator="},
      display columns/1/.style={column name=Females, column type={r}},
      display columns/2/.style={column name=Males, column type={r}},
      display columns/3/.style={column name=Overall, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/popchar.csv}
  \end{center}
Numeric variables are presented as median (25th centile, 75th centile; minimum, maximum). \\
Abbreviations: 
LDL-C -- Low density lipoprotein-cholesterol; 
Lp(a) -- Lipoprotein(a); 
SBP -- Systolic blood pressure;
LSI -- Lifetime smoking index.
\end{table}


\clearpage
\section{Transition probabilities}
\label{TPsec}

Next, the unadjusted transition probabilities for the model need to be estimated. 
By unadjusted, we mean the transition probabilities that will be modified by the 
causal effect of risk factors, as discussed in Section~\ref{RFOsec}. 
MI, IS, ICH, and mortality will be drawn directly from the UK Biobank; 
the age and sex-specific incidence of type 2 diabetes 
in the UK will be sourced from the published literature. 

According to UK Biobank 
(\color{blue}
\url{https://biobank.ctsu.ox.ac.uk/showcase/exinfo.cgi?src=Data_providers_and_dates}
\color{black}
; accessed 14 November 2022),
at the time this extract was downloaded follow-up was complete up to:
\begin{itemize}
\item 30 September 2021 for mortality data from England and Wales
\item 31 October 2021 for mortality data from Scotland
\item 30 September 2021 for hospital data from England
\item 31 July 2021 for hospital data from Scotland
\item 28 February 2018 for hospital data from Wales
\end{itemize}

So it would make sense to censor at 28 February 2018 for Wales, 31 July 2021 for Scotland, and 30 September 2021 for England. 
This means that I'm assuming that people remain in the areas they were living at first assessment, and the assessment centre
was where they live. This is unlikely a major issue, as the overwhelming majority attended their first assessment in England. 

\clearpage
\subsection{MI, IS, ICH, and cause-specific mortality prior to CVD}

To estimate the age specific-incidence of MI, IS, and ICH (both fatal and non-fatal) and
mortality prior to development of CVD, we will use age-period-cohort models \cite{CarstensenSTATMED2007}.
In these, follow-up data will be tabulated into 0.5-year intervals by age and date of follow-up, with
each unit containing the number of events and person-years of follow-up, and the value of age
and date of follow-up corresponding to the midpoint of the interval. A Poisson model
is then fit on this tabulated data. The outcome is the number of events in the interval,
the offset log-person-years, and predictors spline effects of age, year, and cohort (year minus age), 
with a log link function. Knot locations are as suggested by Frank Harrel \cite{Harrell2001Springer}.
Models will be fit separately for males and females.  
These models are then used to predict the incidence of each outcome by age
in 1-year increments, with the prediction year set at 2016, which is roughly the mid-point of 
follow-up. 

The definition of a fatal MI, IS, or ICH will be death during admission for the 
event, determined by a date of death less than or equal to the end of the stay in hospital. 
These also include deaths where the underlying cause of death is MI (this includes all CHD deaths),
IS, and ICH. 
Note also here this is the incidence of the first of any of these events, because in the model,
once one is developed, the individual enters a new, post-CVD health state. 

First, we will tabulate the events, person-years, and calculate the crude rates in 10-year age groups.
Then, fit the models and predict the incidence of each outcome. 

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
clear
append using All_MI All_IS All_ICH
bysort eid (epist) : keep if _n == 1
save EV1, replace
use mainset, clear
merge 1:1 eid using EV1
drop _merge
gen faildate = td(30,9,2021) if ac == "England"
replace faildate = td(31,7,2021) if ac == "Scotland"
replace faildate = td(28,2,2018) if ac == "Wales"
replace faildate = min(dod,epist,faildate)
gen fail = 1 if (epist==faildate | dod==faildate)
recode fail .=0
gen origin = td(1,1,2006)
stset faildate, fail(fail==1) entry(da) origin(origin) scale(365.25) id(eid)
stsplit age, at(0(10)100) after(time=dob)
gen py = _t-_t0
gen fMI = 1 if ((dod <= epien & epien!=. & MI == 1) | (dod==faildate & chddeath==1)) & fail == 1
gen nfMI = 1 if fail == 1 & fMI==. & MI == 1
gen fIS = 1 if ((dod <= epien & epien!=. & IS == 1) | (dod==faildate & isdeath==1)) & fail == 1
gen nfIS = 1 if fail == 1 & fIS==. & IS == 1
gen fICH = 1 if ((dod <= epien & epien!=. & ICH == 1) | (dod==faildate & ichdeath==1)) & fail == 1
gen nfICH = 1 if fail == 1 & fICH==. & ICH == 1
foreach var of varlist oesc-otherd {
replace `var' = 0 if fail != 1
replace `var' = 0 if epist==faildate | chddeath==1 | isdeath==1 | ichdeath==1
}
collapse (sum) py-nfICH oescdeath-otherdeath, by(sex age)
gen age2 = age+9
tostring sex-otherdeath age2, force format(%9.0fc) replace
foreach var of varlist py-otherdeath {
replace `var' = "$<$6" if `var' == "1" | `var' == "2" | `var' == "3" | `var' == "4" | `var' == "5"
}
replace age = age + "-" + age2 if age!="80"
replace age = age+ "+" if age == "80"
drop age2
bysort sex (age) : replace sex ="" if _n!=1
replace sex = "Females" if sex == "0"
replace sex = "Males" if sex == "1"
order sex age py
preserve 
drop oescdeath-otherdeath
export delimited using CSV/miisichntable1.csv, novarnames delimiter(:) replace
restore
drop fMI-nfICH
export delimited using CSV/codtab.csv, novarnames delimiter(:) replace
texdoc stlog close

/***
\color{black}

\begin{landscape}

\begin{table}[h!]
  \begin{center}
    \caption{Incident MI, IS, and ICH counts.}
    \label{miisichntable}
     \fontsize{6pt}{8pt}\selectfont\pgfplotstabletypeset[
      multicolumn names,
      col sep=colon,
	  header=false,
      string type,
	  display columns/0/.style={column name=Sex,
		assign cell content/.code={
\pgfkeyssetvalue{/pgfplots/table/@cell content}
{\multirow{6}{*}{##1}}}},
      display columns/1/.style={column name=Age, column type={l}},
      display columns/2/.style={column name=Person-years, column type={r}, column type/.add={}{|}},
      display columns/3/.style={column name=Fatal MI, column type={r}},
      display columns/4/.style={column name=Non-fatal MI, column type={r}},
      display columns/5/.style={column name=Fatal IS, column type={r}},
      display columns/6/.style={column name=Non-fatal IS, column type={r}},
      display columns/7/.style={column name=Fatal ICH, column type={r}},
      display columns/8/.style={column name=Non-fatal ICH, column type={r}},
      every head row/.style={
        before row={\toprule
					& & & \multicolumn{6}{c}{Outcome}\\
					},
        after row={\midrule}},
        every nth row={6}{before row=\midrule},
        every last row/.style={after row=\bottomrule},
    ]{CSV/miisichntable1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Cause-specific mortality counts.}
    \label{miisichntable}
     \fontsize{6pt}{8pt}\selectfont\pgfplotstabletypeset[
      multicolumn names,
      col sep=colon,
	  header=false,
      string type,
	  display columns/0/.style={column name=Sex,
		assign cell content/.code={
\pgfkeyssetvalue{/pgfplots/table/@cell content}
{\multirow{6}{*}{##1}}}},
      display columns/1/.style={column name=Age, column type={l}},
      display columns/2/.style={column name=Person-years, column type={r}, column type/.add={}{|}},
      display columns/3/.style={column name=\specialcelr{Oesophageal \\ cancer}, column type={r}},
      display columns/4/.style={column name=\specialcelr{Colon \\ cancer}, column type={r}},
      display columns/5/.style={column name=\specialcelr{Pancreatic \\ cancer}, column type={r}},
      display columns/6/.style={column name=\specialcelr{Lung \\ cancer}, column type={r}},
      display columns/7/.style={column name=\specialcelr{Ovarian \\ cancer}, column type={r}},
      display columns/8/.style={column name=\specialcelr{Kidney \\ cancer}, column type={r}},
      display columns/9/.style={column name=\specialcelr{Bladder \\ cancer}, column type={r}},
      display columns/10/.style={column name=Pneumonia, column type={r}},
      display columns/11/.style={column name=COPD, column type={r}},
      display columns/12/.style={column name=ALS, column type={r}},
      display columns/13/.style={column name=\specialcelr{Parkinson's \\ disease}, column type={r}},
      display columns/14/.style={column name=Other, column type={r}},
      every head row/.style={
        before row={\toprule
					& & & \multicolumn{12}{c}{Cause of death}\\
					},
        after row={\midrule}},
        every nth row={6}{before row=\midrule},
        every last row/.style={after row=\bottomrule},
    ]{CSV/codtab.csv}
  \end{center}
Other causes includes all other causes except CHD, IS, and ICH. \\
Abbreviations: COPD -- Chronic obstructive pulmonary disease;
ALS -- amyotrophic lateral sclerosis.
\end{table}
\end{landscape}

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
*mkdir INC
*mkdir GPH
use mainset, clear
merge 1:1 eid using EV1
drop _merge
gen faildate = td(30,9,2021) if ac == "England"
replace faildate = td(31,7,2021) if ac == "Scotland"
replace faildate = td(28,2,2018) if ac == "Wales"
replace faildate = min(dod,epist,faildate)
gen fail = 1 if (epist==faildate | dod==faildate)
recode fail .=0
gen origin = td(1,1,2006)
stset faildate, fail(fail==1) entry(da) origin(origin) scale(365.25) id(eid)
stsplit age, at(0(0.5)100) after(time=dob)
stsplit year, at(0(0.5)20)
gen py = _t-_t0
gen fMI = 1 if ((dod <= epien & epien!=. & MI == 1) | (dod==faildate & chddeath==1)) & fail == 1
gen nfMI = 1 if fail == 1 & fMI==. & MI == 1
gen fIS = 1 if ((dod <= epien & epien!=. & IS == 1) | (dod==faildate & isdeath==1)) & fail == 1
gen nfIS = 1 if fail == 1 & fIS==. & IS == 1
gen fICH = 1 if ((dod <= epien & epien!=. & ICH == 1) | (dod==faildate & ichdeath==1)) & fail == 1
gen nfICH = 1 if fail == 1 & fICH==. & ICH == 1
foreach var of varlist oesc-otherd {
replace `var' = 0 if fail != 1
replace `var' = 0 if epist==faildate | chddeath==1 | isdeath==1 | ichdeath==1
}
collapse (sum) py-nfICH oescdeath-otherdeath, by(sex age year)
save collapseset, replace
use collapseset, clear
foreach var of varlist fMI-luncdeath kidcdeath-otherdeath {
forval s = 0/1 {
use collapseset, clear
keep if sex == `s'
gen coh = year-age
replace age = age+0.25
replace year = year+0.25
pctile AA=age [weight=`var'], nq(40)
foreach i in 2 11 20 29 38 {
local a`i' = r(r`i')
}
mkspline agesp = age, cubic knots(`a2' `a11' `a20' `a29' `a38')
pctile BB=year [weight=`var'], nq(40)
foreach i in 2 11 20 29 38 {
local b`i' = r(r`i')
}
mkspline yearsp = year, cubic knots(`b2' `b11' `b20' `b29' `b38')
pctile CC=coh [weight=`var'], nq(40)
foreach i in 2 11 20 29 38 {
local c`i' = r(r`i')
}
mkspline cohsp = coh, cubic knots(`c2' `c11' `c20' `c29' `c38')
poisson `var' agesp* yearsp* cohsp*, exposure(py)
clear
set obs 55
gen age = _n+29.5
gen year = 10
gen coh = year-age
gen py = 1
mkspline agesp = age, cubic knots(`a2' `a11' `a20' `a29' `a38')
mkspline yearsp = year, cubic knots(`b2' `b11' `b20' `b29' `b38')
mkspline cohsp = coh, cubic knots(`c2' `c11' `c20' `c29' `c38')
predict rate, ir
predict errr, stdp
replace age = age-0.5
gen sex = `s'
keep age sex rate errr
save INC/`var'_`s', replace
}
}
use collapseset, clear
keep if sex == 0
gen coh = year-age
replace age = age+0.25
replace year = year+0.25
pctile AA=age [weight=ovacdeath], nq(40)
foreach i in 2 11 20 29 38 {
local a`i' = r(r`i')
}
mkspline agesp = age, cubic knots(`a2' `a11' `a20' `a29' `a38')
pctile BB=year [weight=ovacdeath], nq(40)
foreach i in 2 11 20 29 38 {
local b`i' = r(r`i')
}
mkspline yearsp = year, cubic knots(`b2' `b11' `b20' `b29' `b38')
pctile CC=coh [weight=ovacdeath], nq(40)
foreach i in 2 11 20 29 38 {
local c`i' = r(r`i')
}
mkspline cohsp = coh, cubic knots(`c2' `c11' `c20' `c29' `c38')
poisson ovacdeath agesp* yearsp* cohsp*, exposure(py)
clear
set obs 55
gen age = _n+29.5
gen year = 10
gen coh = year-age
gen py = 1
mkspline agesp = age, cubic knots(`a2' `a11' `a20' `a29' `a38')
mkspline yearsp = year, cubic knots(`b2' `b11' `b20' `b29' `b38')
mkspline cohsp = coh, cubic knots(`c2' `c11' `c20' `c29' `c38')
predict rate, ir
predict errr, stdp
replace age = age-0.5
replace age = round(age,.1)
gen sex = 0
keep age sex rate errr
save INC/ovacdeath, replace
use collapseset, clear
foreach ii of varlist fMI-luncdeath kidcdeath-otherdeath {
clear
append using INC/`ii'_0 INC/`ii'_1
save INC/`ii', replace
}
use collapseset, clear
foreach var of varlist fMI-nfICH {
if "`var'" == "fMI" {
local va = "Fatal MI"
}
if "`var'" == "nfMI" {
local va = "Non-fatal MI"
}
if "`var'" == "fIS" {
local va = "Fatal IS"
}
if "`var'" == "nfIS" {
local va = "Non-fatal IS"
}
if "`var'" == "fICH" {
local va = "Fatal ICH"
}
if "`var'" == "nfICH" {
local va = "Non-fatal ICH"
}
use INC/`var', clear
replace rate = rate*1000
gen lb = exp(ln(rate)-1.96*errr)
gen ub = exp(ln(rate)+1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 1, color(blue) lpattern(solid)) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) yscale(log range(0.0001 15)) ///
graphregion(color(white)) ///
ylabel(0.0001 "0.0001" 0.001 "0.001" 0.01 "0.01" ///
0.1 "0.1"  1 "1" 10 "10" , angle(0)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Incidence rate (per 1,000 person-years)") ///
xtitle("Age (years)") title(`va', placement(west) size(medium) color(black))
graph save "Graph" GPH/asr_`var', replace
}
use collapseset, clear
foreach var of varlist oescdeath-luncdeath kidcdeath-otherdeath {
if "`var'" == "oescdeath" {
local va = "Oesophagageal cancer"
}
if "`var'" == "colcdeath" {
local va = "Colon cancer"
}
if "`var'" == "pancdeath" {
local va = "Pancreatic cancer"
}
if "`var'" == "luncdeath" {
local va = "Lung cancer"
}
if "`var'" == "kidcdeath" {
local va = "Kidney cancer"
}
if "`var'" == "blacdeath" {
local va = "Bladder cancer"
}
if "`var'" == "pneudeath" {
local va = "Pneumonia"
}
if "`var'" == "copddeath" {
local va = "COPD"
}
if "`var'" == "alsdeath" {
local va = "ALS"
}
if "`var'" == "pddeath" {
local va = "Parkinson's disease"
}
if "`var'" == "otherdeath" {
local va = "Other"
}
use INC/`var', clear
replace rate = rate*1000
gen lb = exp(ln(rate)-1.96*errr)
gen ub = exp(ln(rate)+1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 1, color(blue) lpattern(solid)) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) yscale(log range(0.00001 100)) ///
graphregion(color(white)) ///
ylabel(0.00001 "0.00001" 0.0001 "0.0001" 0.001 "0.001" 0.01 "0.01" ///
0.1 "0.1"  1 "1" 10 "10" 100 "100", angle(0)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Incidence rate (per 1,000 person-years)") ///
xtitle("Age (years)") title(`va', placement(west) size(medium) color(black))
graph save "Graph" GPH/asr_`var', replace
}
clear
append using INC/ovacdeath
replace rate = rate*1000
gen lb = exp(ln(rate)-1.96*errr)
gen ub = exp(ln(rate)+1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 0, color(red) lpattern(solid)) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(2 "Females") ///
cols(1)) yscale(log range(0.00001 100)) ///
graphregion(color(white)) ///
ylabel(0.00001 "0.00001" 0.0001 "0.0001" 0.001 "0.001" 0.01 "0.01" ///
0.1 "0.1"  1 "1" 10 "10" 100 "100", angle(0)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Incidence rate (per 1,000 person-years)") ///
xtitle("Age (years)") title(Ovarian cancer, placement(west) size(medium) color(black))
graph save "Graph" GPH/asr_ovacdeath, replace
texdoc stlog close
texdoc stlog, cmdlog
graph combine ///
GPH/asr_nfMI.gph ///
GPH/asr_fMI.gph ///
GPH/asr_nfIS.gph ///
GPH/asr_fIS.gph ///
GPH/asr_nfICH.gph ///
GPH/asr_fICH.gph ///
, graphregion(color(white)) altshrink cols(2) xsize(4)
texdoc graph, label(CVinc) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific incidence of CVD, by CVD type.)
graph combine ///
GPH/asr_oescdeath.gph ///
GPH/asr_colcdeath.gph ///
GPH/asr_pancdeath.gph ///
GPH/asr_luncdeath.gph ///
GPH/asr_ovacdeath.gph ///
GPH/asr_kidcdeath.gph ///
GPH/asr_blacdeath.gph ///
GPH/asr_pneudeath.gph ///
GPH/asr_copddeath.gph ///
GPH/asr_alsdeath.gph ///
GPH/asr_pddeath.gph ///
GPH/asr_otherdeath.gph ///
, graphregion(color(white)) altshrink cols(3) xsize(4)
texdoc graph, label(codmr) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific mortality rate, by cause of death. ///
Other causes includes all other causes except CHD, IS, and ICH. \\ ///
Abbreviations: COPD -- Chronic obstructive pulmonary disease; ///
ALS -- amyotrophic lateral sclerosis.)
texdoc stlog close

/***
\color{black}

Age- and sex-specific incidence and mortality rates are presented in 
Figures~\ref{CVinc} -~\ref{codmr}. 

\clearpage
\subsection{Repeat events and mortality following CVD}

There are 15 transitions that fall into this category:
\begin{enumerate}
\item MI $\rightarrow$ non-fatal MI
\item MI $\rightarrow$ fatal MI
\item MI $\rightarrow$ non-fatal stroke
\item MI $\rightarrow$ fatal stroke
\item MI $\rightarrow$ other death
\item Stroke $\rightarrow$ non-fatal stroke
\item Stroke $\rightarrow$ fatal stroke
\item Stroke $\rightarrow$ non-fatal MI
\item Stroke $\rightarrow$ fatal MI
\item Stroke $\rightarrow$ other death
\item MI and stroke $\rightarrow$ non-fatal MI
\item MI and stroke $\rightarrow$ fatal MI
\item MI and stroke $\rightarrow$ non-fatal stroke
\item MI and stroke $\rightarrow$ fatal stroke
\item MI and stroke $\rightarrow$ other death
\end{enumerate}

(Recall that the transition to type 2 diabetes in these health states
is unaffected by the presence of CVD). 

The definition of a fatal MI, IS, and ICH are as above. 
First, we must check how much power we have for each of these transitions
before deciding how to analyse the data. 

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
clear
append using All_MI All_IS All_ICH
bysort eid (epist) : drop if epist==epist[_n-1]
save REV, replace
use mainset, clear
merge 1:1 eid using EV1
drop _merge
drop if epist==.
drop if dod <= epien
drop MI IS ICH
rename (epist epien) (fepist fepien)
merge 1:m eid using REV
drop if _merge == 2
drop _merge
sort eid epist
gen faildate = td(30,9,2021) if ac == "England"
replace faildate = td(31,7,2021) if ac == "Scotland"
replace faildate = td(28,2,2018) if ac == "Wales"
drop if epist > faildate
replace epien = dod if dod < epien
bysort eid (epist) : replace faildate = min(dod,epist[_n+1],faildate)
bysort eid (epist) : gen entryvar = fepien if _n == 1
bysort eid (epist) : replace entryvar = epien if _n != 1
format faildate entryvar %td
gen HS =.
bysort eid (epist) : replace HS = 1 if MI == 1 & _n == 1
bysort eid (epist) : replace HS = 2 if MI == . & _n == 1
forval i = 2/8 {
bysort eid (epist) : replace HS = 1 if MI == 1 & HS[_n-1]==1 & _n == `i'
bysort eid (epist) : replace HS = 2 if MI == . & HS[_n-1]==2 & _n == `i'
bysort eid (epist) : replace HS = 3 if MI == 1 & HS[_n-1]==2 & _n == `i'
bysort eid (epist) : replace HS = 3 if MI == . & HS[_n-1]==1 & _n == `i'
bysort eid (epist) : replace HS = 3 if HS[_n-1]==3 & _n == `i'
}
bysort eid (epist) : gen fatal = 1 if dod <= epien[_n+1] & epien[_n+1]!=.
gen OC = 0
bysort eid (epist) : replace OC = 1 if MI[_n+1] == 1 & fatal==.
bysort eid (epist) : replace OC = 2 if (MI[_n+1] == 1 & fatal==1) | (dod==faildate & chddeath==1)
bysort eid (epist) : replace OC = 3 if (IS[_n+1] == 1 | ICH[_n+1] == 1) & fatal==.
bysort eid (epist) : replace OC = 4 if ((IS[_n+1] == 1 | ICH[_n+1] == 1) & fatal==1) | (dod==faildate & (isdeath==1 | ichdeath==1))
bysort eid (epist) : replace OC = 5 if faildate==dod & chddeath==. & isdeath==. & ichdeath==.
drop if entryvar>=faildate
save reventset, replace
forval i = 1/3 {
use reventset, clear
keep if HS == `i'
forval ii = 1/5 {
preserve
gen fail = 1 if OC == `ii'
recode fail .=0
gen origin = td(1,1,2006)
gen id = _n
stset faildate, fail(fail==1) entry(entryvar) origin(origin) scale(365.25) id(id)
stsplit age, at(0(10)100) after(time=dob)
gen py = _t-_t0
collapse (sum) fail py, by(sex age)
rename fail fail`ii'
save tabbedrev_`i'_`ii', replace
restore
}
use tabbedrev_`i'_1, clear
forval ii = 2/5 {
merge 1:1 sex age using tabbedrev_`i'_`ii'
drop _merge
}
if `i' == 3 {
expand 2 if sex == 0 & age == 50
bysort sex age : replace age = 40 if _n == 1 & _n!=_N
foreach var of varlist fail1-fail5 {
replace `var' = 0 if sex == 0 & age == 40
}
}
gen age2 = age+9
tostring py sex age fail1 fail2 fail3 fail4 fail5 age2, force format(%9.0fc) replace
forval ii = 1/5 {
replace fail`ii' = "$<$6" if fail`ii' == "1" |  fail`ii' == "2" |  fail`ii' == "3" |  fail`ii' == "4" |  fail`ii' == "5" 
}
replace age = age + "-" + age2 if age!="80"
replace age = age+ "+" if age == "80"
drop age2
bysort sex (age) : replace sex ="" if _n!=1
replace sex = "Females" if sex == "0"
replace sex = "Males" if sex == "1"
order sex age py
export delimited using CSV/HS`i'pevtab.csv, novarnames delimiter(:) replace
}
texdoc stlog close

/***
\color{black}

The breakdowns of events by starting health state, sex, and age are shown in Tables~\ref{pevtab1} -~\ref{pevtab3}.
The best way to analyse this data, given the lack of power (discussed in Morton et al. \cite{MortonVIH2024}),
will be to assume the incidence and mortality rates are proportional to age, and include factors
for prior MI and stroke. Thus, data will be tabulated into 0.5-year intervals by age,
with each unit containing the number of events and person-years of follow-up, and the value of age
corresponding to the midpoint of the interval. 
A Poisson model is then fit on this tabulated data. The outcome is the number of events in the interval,
the offset log-person-years, and predictors spline effects of age and factor effects of prior MI or stroke,
with a log link function. Knot locations are as suggested by Frank Harrel \cite{Harrell2001Springer}.
Models will be fit separately for males and females.  
These models are then used to predict the incidence of each outcome by age
in 1-year increments.


\begin{table}[h!]
  \begin{center}
    \caption{MI, stroke, and other death counts following MI.}
    \label{pevtab1}
     \fontsize{6pt}{8pt}\selectfont\pgfplotstabletypeset[
      multicolumn names,
      col sep=colon,
	  header=false,
      string type,
	  display columns/0/.style={column name=Sex,
		assign cell content/.code={
\pgfkeyssetvalue{/pgfplots/table/@cell content}
{\multirow{5}{*}{##1}}}},
      display columns/1/.style={column name=Age, column type={l}},
      display columns/2/.style={column name=Person-years, column type={r}, column type/.add={}{|}},
      display columns/3/.style={column name=Non-fatal MI, column type={r}},
      display columns/4/.style={column name=Fatal MI, column type={r}},
      display columns/5/.style={column name=Non-fatal stroke, column type={r}},
      display columns/6/.style={column name=Fatal stroke, column type={r}},
      display columns/7/.style={column name=Other death, column type={r}},
      every head row/.style={
        before row={\toprule
					& & & \multicolumn{5}{c}{Outcome}\\
					},
        after row={\midrule}},
        every nth row={5}{before row=\midrule},
        every last row/.style={after row=\bottomrule},
    ]{CSV/HS1pevtab.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{MI, stroke, and other death counts following stroke.}
    \label{pevtab2}
     \fontsize{6pt}{8pt}\selectfont\pgfplotstabletypeset[
      multicolumn names,
      col sep=colon,
	  header=false,
      string type,
	  display columns/0/.style={column name=Sex,
		assign cell content/.code={
\pgfkeyssetvalue{/pgfplots/table/@cell content}
{\multirow{5}{*}{##1}}}},
      display columns/1/.style={column name=Age, column type={l}},
      display columns/2/.style={column name=Person-years, column type={r}, column type/.add={}{|}},
      display columns/3/.style={column name=Non-fatal MI, column type={r}},
      display columns/4/.style={column name=Fatal MI, column type={r}},
      display columns/5/.style={column name=Non-fatal stroke, column type={r}},
      display columns/6/.style={column name=Fatal stroke, column type={r}},
      display columns/7/.style={column name=Other death, column type={r}},
      every head row/.style={
        before row={\toprule
					& & & \multicolumn{5}{c}{Outcome}\\
					},
        after row={\midrule}},
        every nth row={5}{before row=\midrule},
        every last row/.style={after row=\bottomrule},
    ]{CSV/HS2pevtab.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{MI, stroke, and other death counts following MI and stroke.}
    \label{pevtab3}
     \fontsize{6pt}{8pt}\selectfont\pgfplotstabletypeset[
      multicolumn names,
      col sep=colon,
	  header=false,
      string type,
	  display columns/0/.style={column name=Sex,
		assign cell content/.code={
\pgfkeyssetvalue{/pgfplots/table/@cell content}
{\multirow{5}{*}{##1}}}},
      display columns/1/.style={column name=Age, column type={l}},
      display columns/2/.style={column name=Person-years, column type={r}, column type/.add={}{|}},
      display columns/3/.style={column name=Non-fatal MI, column type={r}},
      display columns/4/.style={column name=Fatal MI, column type={r}},
      display columns/5/.style={column name=Non-fatal stroke, column type={r}},
      display columns/6/.style={column name=Fatal stroke, column type={r}},
      display columns/7/.style={column name=Other death, column type={r}},
      every head row/.style={
        before row={\toprule
					& & & \multicolumn{5}{c}{Outcome}\\
					},
        after row={\midrule}},
        every nth row={5}{before row=\midrule},
        every last row/.style={after row=\bottomrule},
    ]{CSV/HS3pevtab.csv}
  \end{center}
\end{table}

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
forval i = 1/5 {
use reventset, clear
gen fail = 1 if OC == `i'
ta OC
recode fail .=0
gen origin = td(1,1,2006)
gen id = _n
stset faildate, fail(fail==1) entry(entryvar) origin(origin) scale(365.25) id(id)
stsplit age, at(0(0.5)100) after(time=dob)
gen py = _t-_t0
collapse (sum) fail py, by(sex age HS)
if `i' == 1 {
rename fail nfMI
}
if `i' == 2 {
rename fail fMI
}
if `i' == 3 {
rename fail nfS
}
if `i' == 4 {
rename fail fS
}
if `i' == 5 {
rename fail othd
}
save prevcol_`i', replace
}
use prevcol_1, clear
forval i = 2/5 {
merge 1:1 sex HS age using prevcol_`i'
drop _merge
}
save pevcollapseset, replace
use pevcollapseset, clear
gen MI = 0
gen ST = 0
replace MI = 1 if HS == 1 | HS == 3
replace ST = 1 if HS == 2 | HS == 3
foreach var of varlist nfMI fMI-othd {
forval s = 0/1 {
preserve
keep if sex == `s'
replace age = age+0.25
pctile AA=age [weight=`var'], nq(40)
foreach i in 2 11 20 29 38 {
local a`i' = r(r`i')
}
mkspline agesp = age, cubic knots(`a2' `a11' `a20' `a29' `a38')
poisson `var' i.MI i.ST c.agesp*, exposure(py)
clear
set obs 55
gen age = _n+29.5
gen py = 1
expand 3
gen MI = 0
gen ST = 0
bysort age : replace MI = 1 if _n == 1 | _n == 3
bysort age : replace ST = 1 if _n == 2 | _n == 3
mkspline agesp = age, cubic knots(`a2' `a11' `a20' `a29' `a38')
predict rate, ir
predict errr, stdp
replace age = age-0.5
replace age = round(age,.1)
gen sex = `s'
keep age sex rate errr MI ST
save INC/pev_`var'_`s', replace
restore
}
}
clear
gen oc = ""
foreach i in nfMI fMI nfS fS othd {
append using INC/pev_`i'_0 INC/pev_`i'_1
replace oc = "`i'" if oc ==""
}
recast double rate 
recast double errr
reshape wide rate errr, i(age MI ST sex) j(oc) string
order age MI ST sex ratefMI ratenfMI ratefS ratenfS rateothd
preserve
drop errrfMI-errrothd
save pevtp, replace
restore
save pevtpe, replace
foreach i in nfMI fMI nfS fS othd {
if "`i'" == "nfMI" {
local d1 = "Non-fatal MI"
}
if "`i'" == "fMI" {
local d1 = "Fatal MI"
}
if "`i'" == "nfS" {
local d1 = "Non-fatal stroke"
}
if "`i'" == "fS" {
local d1 = "Fatal stroke"
}
if "`i'" == "othd" {
local d1 = "Other death"
}
forval ii = 1/3 {
clear
append using INC/pev_`i'_0 INC/pev_`i'_1
if `ii' == 1 {
keep if MI == 1 & ST == 0
local d2 = "MI → "
}
if `ii' == 2 {
keep if MI == 0 & ST == 1
local d2 = "Stroke → "
}
if `ii' == 3 {
keep if MI == 1 & ST == 1
local d2 = "MI and stroke → "
}
replace rate = rate*1000
gen lb = exp(ln(rate)-1.96*errr)
gen ub = exp(ln(rate)+1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 1, color(blue) lpattern(solid)) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) yscale(log range(0.001 260)) ///
graphregion(color(white)) ///
ylabel(0.001 "0.001" 0.01 "0.01" ///
0.1 "0.1"  1 "1" 10 "10" 100 "100", angle(0)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Incidence rate (per 1,000 person-years)") ///
xtitle("Age (years)") title(`d2' `d1', placement(west) size(medium) color(black))
graph save "Graph" GPH/pevasr_`i'_`ii', replace
}
}
texdoc stlog close
texdoc stlog, cmdlog 
graph combine ///
GPH/pevasr_nfMI_1.gph ///
GPH/pevasr_nfMI_2.gph ///
GPH/pevasr_nfMI_3.gph ///
GPH/pevasr_fMI_1.gph ///
GPH/pevasr_fMI_2.gph ///
GPH/pevasr_fMI_3.gph ///
GPH/pevasr_nfS_1.gph ///
GPH/pevasr_nfS_2.gph ///
GPH/pevasr_nfS_3.gph ///
GPH/pevasr_fS_1.gph ///
GPH/pevasr_fS_2.gph ///
GPH/pevasr_fS_3.gph ///
GPH/pevasr_othd_1.gph ///
GPH/pevasr_othd_2.gph ///
GPH/pevasr_othd_3.gph ///
, graphregion(color(white)) altshrink cols(3) xsize(4)
texdoc graph, label(CVincpev) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific incidence of recurrent CVD or death, by CVD type and starting health state.)
texdoc stlog close

/***
\color{black}


\clearpage
\subsection{The incidence of type 2 diabetes}

Pal et al \cite{PalBMJODRC2021} contains the most contemporary diabetes incidence 
data from the UK (between 1 January 2009 and 31 December 2018). Their results are summarised in 
Table~\ref{tdinctabpal}.

\begin{table}[h!]
\centering
    \caption{Incidence of type 2 diabetes by age and gender.}
    \label{tdinctabpal}
\fontsize{6pt}{10pt}\selectfont\begin{tabular}{llll}
\hline
& \multicolumn{2}{c}{Incidence rate (per 1,000 person-years)} \\
Age, years & Men & Women \\
\hline
0-19 & 0.09 (0.08 to 0.09) & 0.15 (0.14 to 0.16) \\
20-29 & 0.40 (0.38 to 0.41) & 0.92 (0.89 to 0.95) \\
30-39 & 1.47 (1.44 to 1.51) & 1.69 (1.66 to 1.72) \\
40-49 & 4.28 (4.23 to 4.33) & 3.16 (3.12 to 3.21) \\
50-59 & 8.31 (8.23 to 8.39) & 5.82 (5.75 to 5.88) \\
60-69 & 12.49 (12.38 to 12.60) & 8.85 (8.76 to 8.94) \\
70-79 & 13.69 (13.21 to 13.84) & 11.01 (10.89 to 11.13) \\
80-89 & 10.55 (10.35 to 10.76) & 8.86 (8.72 to 9.00) \\
90-99 & 7.02 (6.58 to 7.48) & 5.39 (5.16 to 5.63) \\
\hline
\end{tabular}
\end{table}

Now we just need to convert these to age-specific rates. 
To get proper estimates of uncertainty for these, 
it will be important to have reasonable estimates of the population
numbers underlying the rate estimates in Pal et al. 
They present the overall number of cases of type 2 diabetes by sex (228,034 men and 198,683 women), 
and the crude incidence of type 2 diabetes by sex (4.51 in men, 3.88 in women, per 1,000 person-years), from which we can calculate the 
overall person-years of follow-up via:
\begin{math} py = \frac{N}{incidence} = \end{math} 50,561,863 in men; 51,206,959 in women. 
To distribute this via age, we will assume the population distribution of age in their study
was representative of the UK and thus use data from the Office for National Statistics for mid-2013
(to match the mid-point of Pal et al) \cite{ONSPOP2013}.
With this data, it is possible to model the age-specific incidence of type 2 diabetes in the 
UK using Poisson regression -- the model will use calculated counts as the outcome,
calculated person-years of follow-up as the exposure (log), and include a spline effect of age
(as the mid-point of the interval),
fit separately by sex, with log-link. This model will then predict the age-specific incidence
of type 2 diabetes in the UK (Figure~\ref{t2dincgph}).

\color{Blue4}
***/


texdoc stlog, cmdlog nodo
copy /home/jed/Downloads/ukpop2013.dta ukpop2013.dta
*ONS data
use ukpop2013, clear
tostring age, replace
replace age = "0" + age if length(age)==1
replace age = substr(age,1,1)
replace age = "1" if age == "0"
collapse (sum) N, by(sex age)
bysort sex (age) : egen double sm = sum(N)
gen prp = N/sm
replace age = age+"5"
replace age = "10" if age == "15"
destring age, replace
keep age sex prp
save ukpopprp, replace
clear
set obs 2
gen sex = _n-1
expand 9
bysort sex : gen age = _n*10+5 if _n !=1
recode age .=10
gen inc=.
replace inc = 0.15 in 1
replace inc = 0.92 in 2
replace inc = 1.69 in 3
replace inc = 3.16 in 4
replace inc = 5.82 in 5
replace inc = 8.85 in 6
replace inc = 11.01 in 7
replace inc = 8.86 in 8
replace inc = 5.39 in 9
replace inc = 0.09 in 10
replace inc = 0.40 in 11
replace inc = 1.47 in 12
replace inc = 4.28 in 13
replace inc = 8.31 in 14
replace inc = 12.49 in 15
replace inc = 13.69 in 16
replace inc = 10.55 in 17
replace inc = 7.02 in 18
replace inc = (inc/1000)
save paletal, replace
gen double py = 51206959 if sex == 0
recode py .=50561863
merge 1:1 sex age using ukpopprp
drop _merge
replace py = py*prp
gen N = inc*py
mkspline agesp=age, cubic knots(20(15)95)
forval s = 0/1 {
preserve
poisson N agesp* if sex == `s', exposure(py)
clear
set obs 55
gen age = _n+29.5
gen py = 1
mkspline agesp=age, cubic knots(20(15)95)
predict rate, ir
predict errr, stdp
replace age = age-0.5
replace age = round(age,.1)
gen sex = `s'
keep age sex rate errr
save INC/t2d_`s', replace
restore
}
texdoc stlog close
texdoc stlog, cmdlog
clear
append using INC/t2d_0 INC/t2d_1
save INC/t2d, replace
replace rate = rate*1000
gen lb = exp(ln(rate)-1.96*errr)
gen ub = exp(ln(rate)+1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 1, color(blue) lpattern(solid)) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) yscale(nolog range(0 15)) ///
graphregion(color(white)) ///
ylabel(0(3)15, angle(0) format(%9.0f)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Incidence rate (per 1,000 person-years)") ///
xtitle("Age (years)")
texdoc graph, label(t2dincgph) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific incidence of type 2 diabetes in the UK.)
texdoc stlog close

/***
\color{black}

\clearpage
\section{Risk factor trajectories}
\label{rftrajsec}

Given the way the model works -- recall:
\begin{math}
R_a = R \times M^{x-\mu}
\end{math} from section~\ref{RFOsec}.
We have just estimated \begin{math} R \end{math} in the previous section.
In this section, we need to estimate \begin{math} \mu \end{math}
(\begin{math} x \end{math}, and its dependent, \begin{math} R_a \end{math},
need to be esimtated in the model, so that won't be done here).

It is important that \begin{math} \mu \end{math}, the
time-weighted mean cumulative level of the risk factor 
(or LSI) across the population,
matches the values in the UK Biobank sample 
used to estimate the transition probabilies in the previous section.

For all risk factors, these mean values will be informed by combination of published literature
and the UK Biobank sample. Note that obviously there is individual variability
in these trajectories, but here all that matters is the mean. 

\subsection{LDL-C}

From age 40-69, the values can be estimated directly from UK Biobank. Note by using means
from age 40-69, this incorporates the effect of lipid lowering therapy and the increasing
prevalence of its use with age, as well as decreased survival in people with very high LDL-C. 
We will estimate the mean LDL-C by age and sex using using linear
regression with a spline effect of age, stratified by sex. 
This model will then be used to project LDL-C beyond age 69. 

Prior to age 40, we will assume that mean LDL-C is 0.75 mmol/L at birth \cite{DescampsAth2004}; 
that LDL-C increases linearly from birth to a mean of 2 mmol/L by age 5 \cite{KitJAMA2012};
and that after age 5 LDL-C increases linearly to the mean value of 
LDL-C in UK Biobank at age 40 (as defined by the linear regression model). 

Following this, the cumulative LDL-C, and then mean cumulative LDL-C are estimated, using the 
lower and upper bounds of the 95\%CIs estimated from the linear regression model.
Recall that the cumulative mean needs to be time-weighted; calibration of time-weighting
has been performed previously \cite{MortonVIH2024}. The equation that represents the time-weighting is:
\begin{math}
w = (\frac{x-3}{3})^{-2}
\end{math}
, where \begin{math} w \end{math} is the weighting factor and
\begin{math} x \end{math} is years before the current age for which mean cumulative LDL-C is being calculated.

The estimated age and sex-specific mean LDL-C and mean mean [two means intentional] cumulative LDL-C
are shown in Figures ~\ref{LDLproj} and ~\ref{mcLDLproj}. 
(We have excluded people with missing LDL-C values on the
assumption that there is no major difference in the LDL-C of those missing and those with values available.)

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
forval s = 0/1 {
use mainset, clear
keep if sex == `s'
gen ageda = (da-dob)/365.25
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
reg ldl agesp*
clear
set obs 85
gen age = (_n-1)+0.5
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
predict ldl if inrange(age,40,85)
predict errr if inrange(age,40,85), stdp
replace age = age-0.5
replace ldl = 0.75 if age == 0
replace ldl = 2  if age == 5
replace ldl = (ldl[6]-ldl[1])/5 if inrange(age,1,4)
replace ldl = (ldl[41]-ldl[6])/35 if inrange(age,6,39)
replace ldl = sum(ldl) if inrange(age,0,4)
replace ldl = sum(ldl) if inrange(age,5,39)
gen sex = `s'
keep age sex ldl errr
save ldlmod_`s', replace
}
clear
append using ldlmod_0 ldlmod_1
save ldlmod, replace
forval s = 0/1 {
use ldlmod_`s', clear 
gen lb = ldl-(1.96*errr)
gen ub = ldl+(1.96*errr)
replace lb = ldl if lb==.
replace ub = ldl if ub==.
gen cumldl=.
gen cumldllb=.
gen cumldlub=.
gen aveldl=.
gen aveldllb=.
gen aveldlub=.
forval ii = 0/84 {
gen logf = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen ldllog = ldl*logf
gen ldlloglb = lb*logf
gen ldllogub = ub*logf
gen cumldllog = sum(ldllog)
gen cumldlloglb = sum(ldlloglb)
gen cumldllogub = sum(ldllogub)
gen cumlog = sum(logf)
replace cumldl = cumldllog if age == `ii'
replace cumldllb = cumldlloglb if age == `ii'
replace cumldlub = cumldllogub if age == `ii'
replace aveldl = cumldllog/cumlog if age == `ii'
replace aveldllb = cumldlloglb/cumlog if age == `ii'
replace aveldlub = cumldllogub/cumlog if age == `ii'
drop logf ldllog ldlloglb ldllogub cumldllog cumldlloglb cumldllogub cumlog
}
keep sex age aveldl aveldllb aveldlub
keep if age >= 30
save aveldl_cal_`s', replace
}
clear
append using aveldl_cal_0 aveldl_cal_1
save aveldl_cal, replace
texdoc stlog close
texdoc stlog, cmdlog 
use ldlmod, clear
gen lb = ldl-(1.96*errr)
gen ub = ldl+(1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line ldl age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line ldl age if sex == 1, color(blue) lpattern(solid)) ///
, legend(position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) graphregion(color(white)) ///
ylabel(, angle(0) format(%9.1f)) ///
xlabel(0(10)80, nogrid) ///
ytitle("LDL-C (mmol/L)") ///
xtitle("Age")
texdoc graph, label(LDLproj) figure(h!) cabove fontface("Liberation Sans") ///
caption(Mean LDL-C by age and sex.)
use aveldl_cal, clear
twoway ///
(rarea aveldlub aveldllb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line aveldl age if sex == 0, color(red) lpattern(solid)) ///
(rarea aveldlub aveldllb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line aveldl age if sex == 1, color(blue) lpattern(solid)) ///
, legend(position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) graphregion(color(white)) ///
ylabel(, angle(0) format(%9.1f)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Mean cumulative LDL-C (mmol/L)") ///
xtitle("Age")
texdoc graph, label(mcLDLproj) figure(h!) cabove fontface("Liberation Sans") ///
caption(Time-weighted mean cumulative LDL-C by age and sex.)
texdoc stlog close

/***
\color{black}

\clearpage
\subsection{Lp(a)}

Lp(a) is fully expressed by the first year of life \cite{WangPed1992,RifaiAth1992,McNealJCL2015}, 
and it is largely genetically determined \cite{BoerJCI1992},
meaning the Lp(a) value measured in adulthood should effectively be the same across the lifespan.
As with LDL-C, Lp(a) will be modelled using linear regression with a spline effect of age, stratified by sex.
These models will then be used to project Lp(a) from age 70 to 85 years, and prior to age 40
Lp(a) will be assumed to be the same value as age 40. The projected mean Lp(a) across
the lifespan is shown in Figure~\ref{LPAproj} and the mean mean cumulative Lp(a) in Figure~\ref{mcLPAproj}. 
The time-weighting is the same as for LDL-C.

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
forval s = 0/1 {
use mainset, clear
keep if sex == `s'
gen ageda = (da-dob)/365.25
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
reg lpa agesp*
clear
set obs 85
gen age = (_n-1)+0.5
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
predict lpa if inrange(age,40,85)
predict errr if inrange(age,40,85), stdp
replace age = age-0.5
replace lpa = lpa[41] if lpa==.
replace errr = errr[41] if errr==.
gen sex = `s'
keep age sex lpa errr
save lpamod_`s', replace
}
forval s = 0/1 {
use lpamod_`s', clear 
gen lb = lpa-(1.96*errr)
gen ub = lpa+(1.96*errr)
replace lb = lpa if lb==.
replace ub = lpa if ub==.
gen cumlpa=.
gen cumlpalb=.
gen cumlpaub=.
gen avelpa=.
gen avelpalb=.
gen avelpaub=.
forval ii = 0/84 {
gen logf = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog = lpa*logf
gen lpaloglb = lb*logf
gen lpalogub = ub*logf
gen cumlpalog = sum(lpalog)
gen cumlpaloglb = sum(lpaloglb)
gen cumlpalogub = sum(lpalogub)
gen cumlog = sum(logf)
replace cumlpa = cumlpalog if age == `ii'
replace cumlpalb = cumlpaloglb if age == `ii'
replace cumlpaub = cumlpalogub if age == `ii'
replace avelpa = cumlpalog/cumlog if age == `ii'
replace avelpalb = cumlpaloglb/cumlog if age == `ii'
replace avelpaub = cumlpalogub/cumlog if age == `ii'
drop logf lpalog lpaloglb lpalogub cumlpalog cumlpaloglb cumlpalogub cumlog
}
keep sex age avelpa avelpalb avelpaub
keep if age >= 30
save avelpa_cal_`s', replace
}
clear
append using avelpa_cal_0 avelpa_cal_1
save avelpa_cal, replace
texdoc stlog close
texdoc stlog, cmdlog
clear
append using lpamod_0 lpamod_1
gen lb = lpa-(1.96*errr)
gen ub = lpa+(1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line lpa age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line lpa age if sex == 1, color(blue) lpattern(solid)) ///
, legend(position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) graphregion(color(white)) ///
ylabel(, angle(0) format(%9.1f)) ///
xlabel(0(10)80, nogrid) ///
ytitle("Lp(a) (mg/dL)") ///
xtitle("Age")
texdoc graph, label(LPAproj) figure(h!) cabove fontface("Liberation Sans") ///
caption(Mean Lp(a) by age and sex -- projected.)
use avelpa_cal, clear
twoway ///
(rarea avelpaub avelpalb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line avelpa age if sex == 0, color(red) lpattern(solid)) ///
(rarea avelpaub avelpalb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line avelpa age if sex == 1, color(blue) lpattern(solid)) ///
, legend(position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) graphregion(color(white)) ///
ylabel(, angle(0) format(%9.1f)) ///
xlabel(30(10)80, nogrid) yscale(range(21.0 22.7)) ///
ytitle("Mean cumulative Lp(a) (mg/dL)") ///
xtitle("Age")
texdoc graph, label(mcLPAproj) figure(h!) cabove fontface("Liberation Sans") ///
caption(Mean cumulative Lp(a) by age and sex -- projected.)
texdoc stlog close

/***
\color{black}

\clearpage
\subsection{SBP}

As for LDL-C and Lp(a), a linear regression model with spline effects of age, 
stratified by sex will be used to estimate mean SBP for ages 40-69, and project 
SBP from 70 to 85. 

The assumptions used to inform the projections prior to age 40 follow. 
SBP is 85 mmHg at age 1 and increases linearly to 118mmHg at age 17. This 
is derived from Table 3 in ``The Fourth Report on The Diagnosis, Evaluation, 
and Treatment of High Blood Pressure in Children and Adolescents'' \cite{FourthHBP}.
From age 17 to 40, SBP increases linearly to age 40 (the value of which is
derived from the linear regression model described above) \cite{JiJAMA2020}. 
Age 40 happens to be a point of inflection for SBP values over the lifetime (very fortunate for
this dataset) \cite{JiJAMA2020}. (This paper also shows a lower SBP among females
at age 40, with a faster increase from that age than males, eventually 
surpassing males, consistent with the UK Biobank data as seen in Figure~\ref{SBPproj}). 

The time-weighting formula for SBP is 
\begin{math}
w = (\frac{x-2.1}{2.1})^{-2}
\end{math}
\cite{MortonVIH2024}.

The projected mean SBP across the lifespan is shown in Figure~\ref{SBPproj} 
and the mean mean cumulative SBP in Figure~\ref{mcSBPproj}. 

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
forval s = 0/1 {
use mainset, clear
keep if sex == `s'
gen ageda = (da-dob)/365.25
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
reg sbp agesp*
clear
set obs 85
gen age = (_n-1)+0.5
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
predict sbp if inrange(age,40,85)
predict errr if inrange(age,40,85), stdp
replace age = age-0.5
replace sbp = 85 if age == 0
replace sbp = 118  if age == 17
replace sbp = (sbp[18]-sbp[1])/17 if inrange(age,1,16)
replace sbp = (sbp[41]-sbp[18])/23 if inrange(age,18,39)
replace sbp = sum(sbp) if inrange(age,0,16)
replace sbp = sum(sbp) if inrange(age,17,39)
gen sex = `s'
keep age sex sbp errr
save sbpmod_`s', replace
}
forval s = 0/1 {
use sbpmod_`s', clear 
gen lb = sbp-(1.96*errr)
gen ub = sbp+(1.96*errr)
replace lb = sbp if lb==.
replace ub = sbp if ub==.
gen cumsbp=.
gen cumsbplb=.
gen cumsbpub=.
gen avesbp=.
gen avesbplb=.
gen avesbpub=.
forval ii = 0/84 {
gen logf = ((age-`ii'-2.1)/2.1)^(-2) if age <= `ii'
gen sbplog = sbp*logf
gen sbploglb = lb*logf
gen sbplogub = ub*logf
gen cumsbplog = sum(sbplog)
gen cumsbploglb = sum(sbploglb)
gen cumsbplogub = sum(sbplogub)
gen cumlog = sum(logf)
replace cumsbp = cumsbplog if age == `ii'
replace cumsbplb = cumsbploglb if age == `ii'
replace cumsbpub = cumsbplogub if age == `ii'
replace avesbp = cumsbplog/cumlog if age == `ii'
replace avesbplb = cumsbploglb/cumlog if age == `ii'
replace avesbpub = cumsbplogub/cumlog if age == `ii'
drop logf sbplog sbploglb sbplogub cumsbplog cumsbploglb cumsbplogub cumlog
}
keep sex age avesbp avesbplb avesbpub
keep if age >= 30
save avesbp_cal_`s', replace
}
clear
append using avesbp_cal_0 avesbp_cal_1
save avesbp_cal, replace
texdoc stlog close
texdoc stlog, cmdlog
clear
append using sbpmod_0 sbpmod_1
gen lb = sbp-(1.96*errr)
gen ub = sbp+(1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line sbp age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line sbp age if sex == 1, color(blue) lpattern(solid)) ///
, legend(position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) graphregion(color(white)) ///
ylabel(, angle(0) format(%9.1f)) ///
xlabel(0(10)80, nogrid) ///
ytitle("SBP (mmHg)") ///
xtitle("Age")
texdoc graph, label(SBPproj) figure(h!) cabove fontface("Liberation Sans") ///
caption(Mean SBP by age and sex -- projected.)
use avesbp_cal, clear
twoway ///
(rarea avesbpub avesbplb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line avesbp age if sex == 0, color(red) lpattern(solid)) ///
(rarea avesbpub avesbplb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line avesbp age if sex == 1, color(blue) lpattern(solid)) ///
, legend(position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) graphregion(color(white)) ///
ylabel(, angle(0) format(%9.1f)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Mean cumulative SBP (mmHg)") ///
xtitle("Age")
texdoc graph, label(mcSBPproj) figure(h!) cabove fontface("Liberation Sans") ///
caption(Mean cumulative SBP by age and sex -- projected.)
texdoc stlog close

/***
\color{black}

\clearpage
\subsection{Type 2 diabetes}

To derive the age-specific prevalence of type 2 diabetes, we will use a 
generalised linear model with the following specifications:
a binomial outcome distribution; a log-link function; paramaterised with spline effects of age; 
and one observation per person. 
A limitation is that 
this projection (Figure~\ref{DMPproj}) involves using data from
people aged 40-69 to project the prevalence of diabetes out to age 85 years. 
This is not good, especially considering the prevalence of diabetes could
plateau somewhere in this age range \cite{CarstensenBMJO2020,SharmaBMJO2016}. 
Nevertheless, there isn't much else to do here without introducing other
datasets (which come with their own limitations), so this seems like
the least bad option. The projection to ages below 40 is less concerning, given 
the prevalence is just low and very unlikely to have a point of inflection in this age range
\cite{CarstensenBMJO2020,SharmaBMJO2016}.

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
forval s = 0/1 {
use mainset, clear
keep if sex == `s'
recode DMC .=0
gen ageda = (da-dob)/365.25
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
glm DMC agesp*, family(binomial) link(log)
clear
set obs 55
gen age = (_n+29)+0.5
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
predict DMP
predict errr, stdp
replace age = age-0.5
gen sex = `s'
keep age sex DMP errr
save DMmod_`s', replace
}
texdoc stlog close
texdoc stlog, cmdlog
clear
append using DMmod_0 DMmod_1
save DMmod, replace
replace DMP = DMP*100
gen lb = exp(ln(DMP)-1.96*errr)
gen ub = exp(ln(DMP)+1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line DMP age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line DMP age if sex == 1, color(blue) lpattern(solid)) ///
, legend(position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) graphregion(color(white)) ///
ylabel(0(10)30, angle(0) format(%9.0f)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Prevalence of type 2 diabetes (%)") ///
xtitle("Age (years)")
texdoc graph, label(DMPproj) figure(h!) cabove fontface("Liberation Sans") ///
caption(Type 2 diabetes prevalence by age and sex -- projected.)
texdoc stlog close

/***
\color{black}

\clearpage
\subsection{LSI}

We will model the baseline LSI as a function of age, period, and cohort, and use this to estimate
the mean LSI by age for the UK Biobank cohort in 2016 (to match the year used
for transition probabilities). 
To do this we will use a generalised linear model with the following specifications:
a gamma outcome distribution (the LSI is linear and non-negative); a log-link function; 
paramaterised with spline effects of age, period, and cohort; and one observation per person 
(i.e., no weighting). This will then be used to predict the age-specific LSI in 2016. 

We have included period effects in this model because of the strong decline
in smoking prevalence over time \cite{ONSSmoking2021}.  
As with type 2 diabetes, this projection (Figure~\ref{LSIproj}) involves using data from
people aged 40-69 to project the mean LSI out to age 85 years. This is obviously
not good -- cigarettes have a negative impact on mortality, 
so we suspect the LSI could drop off much faster than the projections here. Nevertheless, as above,
there isn't much to be done about this without going to other data sources, so 
we will accept this limitation. 

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
forval s = 0/1 {
use mainset, clear
keep if sex == `s'
gen ageda = (da-dob)/365.25
gen year = year(da)
gen month = month(da)
gen dfu = (da-td(1,1,2009))/365.25
gen coh = dfu-age
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
mkspline dfusp=dfu, cubic knots(-1.5 0 1.5)
mkspline cohsp=coh, cubic knots(-68.5 -58 -40.5)
glm LSI agesp* dfusp* cohsp*, family(gamma) link(log)
clear
set obs 55
gen age = (_n+29)+0.5
gen dfu = 7
gen coh = dfu-age
mkspline agesp=age, cubic knots(42.5 50 58 63.5 68.5)
mkspline dfusp=dfu, cubic knots(-1.5 0 1.5)
mkspline cohsp=coh, cubic knots(-68.5 -58 -40.5)
predict LSI
predict errr, stdp
replace age = age-0.5
gen sex = `s'
keep age sex LSI errr
save LSImod_`s', replace
}
texdoc stlog close
texdoc stlog, cmdlog
clear
append using LSImod_0 LSImod_1
save LSImod, replace
gen lb = exp(ln(LSI)-1.96*errr)
gen ub = exp(ln(LSI)+1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line LSI age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line LSI age if sex == 1, color(blue) lpattern(solid)) ///
, legend(position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) graphregion(color(white)) ///
ylabel(0(0.1)0.5, angle(0) format(%9.1f)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Mean LSI") ///
xtitle("Age (years)")
texdoc graph, label(LSIproj) figure(h!) cabove fontface("Liberation Sans") ///
caption(Mean LSI by age and sex -- projected.)
texdoc stlog close



/***
\color{black}


\section{Base-case: study 1}

Going back to our equation:
\begin{math}
R_a = R \times M^{x-\mu}
\end{math} -- we now have 
\begin{math} R \end{math}
and \begin{math} \mu \end{math}.
Now we need to estimate \begin{math} x \end{math}
and \begin{math} R_a \end{math}. However, they cannot
be estimated outside of the model -- they require interventions
or control scenarios, which in turn require microsimulation. 
It is too computationally intensive to simulate the entire UK Biobank,
so we will just select a random sample of 10,000 people to run the simulation
on. 

\subsection{Setting up the model population}

However, before the model begins, we will need to estimate
risk factor trajectories (\begin{math} x \end{math}) prior
to model start point for each individual who enters the model. 
To do this, we need to make several assumptions about risk factor trajectories. 

For LDL-C, the assumptions are as follows.
\begin{itemize}
\item LDL-C is constant from age 40 onwards in people who don't take lipid lowering therapy \cite{DuncanJAHA2019}. 
\item Mean LDL-C is 0.75 mmol/L at birth \cite{DescampsAth2004}, 
increases linearly to a mean of 2 mmol/L (standard deviation: 0.5) by age 5
(assumption based on \cite{KitJAMA2012}), and after this increases linearly to whatever value
the individual has recorded in UK Biobank by age 40. The standard deviation for both these
values is assumed to be 25\% (so 0.1875 and 0.5, respectively). 
\item Where an individual sits on the LDL-C distribution is constant throughout life (i.e., someone in the 
5th percentile of LDL-C will be in that percentile for life). 
\item People receiving lipid lowering therapy at baseline initiated therapy 5 years before their date of first assessment. 
Given how low lipid lowering therapy persistence is, \cite{TothLHD2019,TalicCDT2021,OforiJOG2017} 
this is probably a reasonably conservative assumption.
\item lipid lowering therapy lowers LDL-C by 30\%. This is an assumption based on real-world studies of statin 
effectiveness \cite{FangLHD2021,BacquerEJPC2020}. This is only prior to model start, 
after which the model assumptions and inputs take over.
\end{itemize}

For SBP, the assumptions are as follows. 
\begin{itemize}
\item SBP is 85 mmHg at age 0 and increases linearly to 118 mmHg at age 17 \cite{FourthHBP}.
\item SBP increases linearly from age 17 until the model start age, after which it increase
at the mean rate for the UK Biobank. The rate of increase is determined
by calculating the linear rate of increase between the 118 mmHg value at age 17
and the value at whatever age the person enrols in UK Biobank. 
\item People receiving anti-hypertensive therapy at baseline had been on it for 
10 years prior. 
\item One, two, and three antihypertensive drugs lead to SBP reductions of 6.7 mmHg, 13.3 mmHg, 
and 19.9 mmHg, respectively \cite{LawBMJ2003}. Again, this is only prior to model start,
after which the model assumptions and inputs take over. 
\end{itemize}

\color{Blue4}
***/

texdoc stlog
use mainset, clear
quietly su ldl
di round(r(sd),0.01)
quietly su(sbp), detail
di r(p99)
texdoc stlog close
texdoc stlog, cmdlog nodo
drop if ldl==.
drop if lpa ==.
drop if sbp ==.
drop if hdl ==.
gen daage = round((da-dob)/365.25,1)
keep if inrange(daage,40,69)
set seed 1312
gen rand = uniform()
sort rand
keep if _n<=10000
gen ind = _n
expand 85
bysort ind : gen age = _n-1
replace ldl = ldl/0.7 if LLT==1
rename ldl ldlm
merge m:1 sex age using ldlmod, keep(1 3) nogen
sort ind age
bysort ind (age) : gen sdldl = (ldlm-ldl[41])/0.86
replace ldl = ldl+0.1875*sdldl if age ==0
replace ldl = ldl+0.5*sdldl if age==5
replace ldl = ldlm if age >=40
bysort ind (age) : replace ldl = (ldl[6]-ldl[1])/5 if inrange(age,1,4)
bysort ind (age) : replace ldl = sum(ldl) if inrange(age,0,4)
bysort ind (age) : replace ldl = (ldl[41]-ldl[6])/35 if inrange(age,6,39)
bysort ind (age) : replace ldl = sum(ldl) if inrange(age,5,39)
replace ldl = ldl*0.7 if inrange(age,daage-6,daage-1) & LLT==1
replace ldl = . if age > daage
replace lpa =. if age > daage
replace sbp = sbp+6.7 if AHT == 1
replace sbp = sbp+13.3 if AHT == 2
replace sbp = sbp+19.9 if AHT >= 3
gen sbpo = sbp
replace sbp=. if age!=daage
replace sbp = 85 if age == 0
replace sbp = 118  if age == 17
bysort ind (age) : replace sbp = (sbp[18]-sbp[1])/17 if inrange(age,1,16)
bysort ind (age) : replace sbp = sum(sbp) if inrange(age,0,16)
bysort ind (age) : replace sbp = (sbpo-sbp[18])/(daage-17) if inrange(age,18,daage-1)
bysort ind (age) : replace sbp = sum(sbp) if inrange(age,17,daage-1)
replace sbp = sbp-6.7 if inrange(age,daage-11,daage-1) & AHT==1
replace sbp = sbp-13.3 if inrange(age,daage-11,daage-1) & AHT==2
replace sbp = sbp-19.9 if inrange(age,daage-11,daage-1) & AHT>=3
replace LSI = . if age!=daage
gen cs = 1 if tsc == 0
gen ps = 1 if tsc != 0 & tsc !=.
bysort ind (age) : replace dursmk = dursmk[_n-1]+1 if age > daage & cs == 1
bysort ind (age) : replace tsc = tsc[_n-1]+1 if age > daage & ps == 1
replace LSI = (1-(0.5^(dursmk/18)))*(0.5^(tsc/18))*ln(ncig+1) if cs == 1 | ps == 1
replace LSI = 0 if ps == . & cs == .
replace LSI = . if age < daage
gen agesta = daage-dursmk
gen agesto = daage-tsc if tsc!=0
replace dursmk = age-agesta if tsc != 0
replace tsc = age-agesto
gen cycle = age-daage if age >= daage
gen DM = 0 if cycle==0
replace DM = 1 if DMC == 1 & cycle==0
gen MI = 0 if cycle==0
gen ST = 0 if cycle==0
gen DT = 0 if cycle==0
gen DME = .
gen MIE = .
gen STE = .
gen DTE = .
replace LLT = 0
replace AHT = 0
replace LLT = . if cycle!=0
replace AHT = . if cycle!=0
replace hdl = . if age < daage
recode cs .=0
keep ind sex lpa ldl sbp LSI rand ind age cycle-DTE LLT AHT hdl cs
replace rand = uniform()
order ind sex age cs hdl ldl lpa sbp LSI cycle DM DME MI MIE ST STE DT DTE LLT AHT rand
rename LSI lsi
save modstart, replace
forval s = 0/2 {
use modstart, clear
keep if cycle == 0
drop if sex == `s'
count
matrix A = (r(N),.,.,.,.)
su age, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
count if DM==1
matrix A = (A\r(N),.,.,.,.)
su ldl, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
su lpa, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
count if lpa >= 50
matrix A = (A\r(N),.,.,.,.)
count if lpa >= 70
matrix A = (A\r(N),.,.,.,.)
count if lpa >= 90
matrix A = (A\r(N),.,.,.,.)
count if lpa >= 110
matrix A = (A\r(N),.,.,.,.)
su sbp, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
su lsi, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
mat A`s' = (J(11,1,`s'),A)
}
mat A = (A0\A1\A2)
clear
svmat double A
gen njm = _n
bysort A1 (njm) : gen perc = 100*A2/A2[1] if _n == 3 | inrange(_n,6,9)
forval i = 2/6 {
bysort A1 (njm) : replace A`i' = (A`i'*2.18)-3.83 if _n == 5
replace A`i' = 0 if A`i'<0
}
tostring A2-A6, gen(B2 B3 B4 B5 B6) format(%9.0fc) force
tostring A2 A3 A4 A5 A6 perc, replace format(%9.1f) force
bysort A1 (njm) : gen A = B2 if _n == 1
bysort A1 (njm) : replace A = B2 + " (" + perc + "\%)" if _n == 3 | inrange(_n,6,9)
bysort A1 (njm) : replace A = B4 + " (" + B3 + ", " + B5 + "; " + B2 + ", " + B6 + ")" if _n == 2 | _n == 10
bysort A1 (njm) : replace A = A4 + " (" + A3 + ", " + A5 + "; " + A2 + ", " + A6 + ")" if A==""
bysort A1 (njm) : gen row = _n
keep A1 A row
reshape wide A, j(A1) i(row)
drop row
gen R1 = "N" if _n == 1
replace R1 = "Age" if _n == 2
replace R1 = "N (\%) with diabetes" if _n == 3
replace R1 = "LDL-C (mmol/L)" if _n == 4
replace R1 = "Lp(a) (nmol/L)" if _n == 5
replace R1 = "N (\%) with Lp(a) $\geq$105 nmol/L (50 mg/dL)" if _n == 6
replace R1 = "N (\%) with Lp(a) $\geq$149 nmol/L (70 mg/dL)" if _n == 7
replace R1 = "N (\%) with Lp(a) $\geq$192 nmol/L (90 mg/dL)" if _n == 8
replace R1 = "N (\%) with Lp(a) $\geq$236 nmol/L (110 mg/dL)" if _n == 9
replace R1 = "SBP (mmHg)" if _n == 10
replace R1 = "LSI" if _n == 11
order R1 A1 A0 A2
export delimited using CSV/popchar_MS.csv, delimiter(":") novarnames replace
texdoc stlog close


/***
\color{black}

Population characteristics for the random sample are shown in Table~\ref{popcharMStab}.

\begin{table}[h!]
  \begin{center}
    \caption{Baseline characteristics for the model starting population.}
    \label{popcharMStab}
	\hspace*{-2cm}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=, column type={l}, text indicator="},
      display columns/1/.style={column name=Females, column type={r}},
      display columns/2/.style={column name=Males, column type={r}},
      display columns/3/.style={column name=Overall, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/popchar_MS.csv}
  \end{center}
Numeric variables are presented as median (25th centile, 75th centile; minimum, maximum). \\
Abbreviations: 
LDL-C -- Low density lipoprotein-cholesterol; 
Lp(a) -- Lipoprotein(a); 
SBP -- Systolic blood pressure;
LSI -- Lifetime smoking index.
\end{table}

This data can now be put in excel and the model can be run on this population. 
Nevertheless, I will perform the rest of the analysis in Stata as well,
so that it is reproducible. 

We have also made a few other assumptions about what happens once the model begins:
\begin{itemize}
\item The LSI was calculated assuming people who are not smokers remain non-smokers,
and smokers remain smokers. 
\item HDL-C remains constant over the lifetime (from the level at assessment onwards;
this only effects calculation of SCORE-2 risk).
\item After model start, SBP will increase at the mean rate for the sex,
which are calculated below.
\end{itemize}

\color{Blue4}
***/

texdoc stlog, cmdlog
clear
append using sbpmod_0 sbpmod_1
keep if age >= 40
bysort sex (age) : gen dydx = (sbp-sbp[_n-1])
bysort sex : egen dydxm = mean(dydx)
keep if age == 40
format dydxm % 9.2f
texdoc stlog close
texdoc stlog
list sex dydxm
texdoc stlog close

/***
\color{black}

\subsection{Control scenario}

First, the control scenario. 
Recall from section~\ref{s1sec} that people are to undergo screening 
every 5 years, after which a treatment algorithm follows. We will
start everyone at baseline with a screening check, and then repeat 
screening every 5 years. 
excel
\color{Blue4}
***/

*Takes roughly half an hour

texdoc stlog, cmdlog nodo
use modstart, clear
quietly {
forval c = 0/44 {
if `c' == 0 | `c' == 5 | `c' == 10 | `c' == 15 | `c' == 20 ///
| `c' == 25 |  `c' == 30 | `c' == 35 | `c' == 40 | `c' == 45 {
gen tyr = 100*(1-0.9776^(exp( ///
(0.4648*((age-60)/5)) + ///
(0.7744*cs) + ///
(0.3131*((sbp-120)/20)) + ///
(0.1002*(ldl+hdl+0.5-6)) + ///
(-0.2606*((hdl-1.3)/0.5)) + ///
(-0.1088*(cs*(age-60)/5)) + ///
(-0.0277*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0226*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0613*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 0
replace tyr = 100*(1-0.9605^(exp( ///
(0.3742*((age-60)/5)) + ///
(0.6012*cs) + ///
(0.2777*((sbp-120)/20)) + ///
(0.1458*(ldl+hdl+0.5-6)) + ///
(-0.2698*((hdl-1.3)/0.5)) + ///
(-0.0755*(cs*(age-60)/5)) + ///
(-0.0255*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0281*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0426*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 1
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
gen cumldl=.
gen mcldl=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen ldllog_`ii' = ldl*logf_`ii'
bysort ind (age) : gen cumldllog_`ii' = sum(ldllog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumldl = cumldllog_`ii' if age == `ii'
replace mcldl = cumldllog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumldl
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
gen cumsbp=.
gen mcsbp=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-2.1)/2.1)^(-2) if age <= `ii'
gen sbplog_`ii' = sbp*logf_`ii'
bysort ind (age) : gen cumsbplog_`ii' = sum(sbplog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumsbp = cumsbplog_`ii' if age == `ii'
replace mcsbp = cumsbplog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumsbp
replace mcldl = . if cycle!=`c'
replace mclpa = . if cycle!=`c'
replace mcsbp = . if cycle!=`c'
merge m:1 sex age using aveldl_cal, keep(1 3) nogen
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
merge m:1 sex age using avesbp_cal, keep(1 3) nogen
merge m:1 sex age using DMmod, keep(1 3) nogen
merge m:1 sex age using LSImod, keep(1 3) nogen
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
merge m:1 age sex using INC/`i'
drop _merge errr
rename (rate) (rate_`i')
}
replace rate_t2d = 0 if DM == 1
recast double rate_t2d-rate_nfICH
*replace rate_t2d = rate_t2d*(0.763^(mcldl-aveldl))
replace rate_t2d = rate_t2d*(1.21^(lsi-LSI))
foreach i in nf f {
replace rate_`i'MI=rate_`i'MI*(2.083^(mcldl-aveldl))
replace rate_`i'MI=rate_`i'MI*(1.0054^(mclpa-avelpa))
replace rate_`i'MI=rate_`i'MI*(1.058^(mcsbp-avesbp))
replace rate_`i'MI=rate_`i'MI*(1.43^(lsi-LSI))
replace rate_`i'MI=rate_`i'MI/(1+(0.26*DMP)) if DM == 0
replace rate_`i'MI=1.26*rate_`i'MI/(1+(0.26*DMP)) if DM == 1
replace rate_`i'IS=rate_`i'IS*(1.08^(mcldl-aveldl))
replace rate_`i'IS=rate_`i'IS*(1.0035^(mclpa-avelpa))
replace rate_`i'IS=rate_`i'IS*(1.027^(mcsbp-avesbp))
replace rate_`i'IS=rate_`i'IS*(1.33^(lsi-LSI))
replace rate_`i'IS=rate_`i'IS/(1+(0.74*DMP)) if DM == 0
replace rate_`i'IS=1.74*rate_`i'IS/(1+(0.74*DMP)) if DM == 1
replace rate_`i'ICH=rate_`i'ICH*(1.039^(mcsbp-avesbp))
}
replace rate_blacdeath = rate_blacdeath*(2.52^(lsi-LSI))
replace rate_colcdeath = rate_colcdeath*(1.24^(lsi-LSI))
replace rate_oescdeath = rate_oescdeath*(3.67^(lsi-LSI))
replace rate_kidcdeath = rate_kidcdeath*(1.69^(lsi-LSI))
replace rate_luncdeath = rate_luncdeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_luncdeath = rate_luncdeath*(37.6) if lsi-LSI > 0.694*2
replace rate_ovacdeath = rate_ovacdeath*(1.27^(lsi-LSI))
replace rate_pancdeath = rate_pancdeath*(2.13^(lsi-LSI))
replace rate_pneudeath = rate_pneudeath*(1.016^(mcsbp-avesbp))
replace rate_pneudeath = rate_pneudeath*(4.03^(lsi-LSI))
replace rate_copddeath = rate_copddeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_copddeath = rate_copddeath*(37.6) if lsi-LSI > 0.694*2
replace rate_alsdeath = rate_alsdeath*(1.09^(mcldl-aveldl))
replace rate_pddeath = rate_pddeath*(0.48^(lsi-LSI))
recode rate_ovacdeath .=0
merge m:1 sex MI ST age using pevtp, keep(1 3) nogen
sort ind age
gen ratesum0 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace ratesum0 = ratesum0+`var' if MI == 0 & ST == 0
}
gen tpsum0 = 1-exp(-ratesum0)
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = tpsum0*`var'/ratesum0 if MI == 0 & ST == 0
}
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = `var'+`var1' if MI == 0 & ST == 0
local var1 = "`var'"
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,rate_fMI) | inrange(rand,rate_nfMI,rate_fIS) | inrange(rand,rate_nfIS,rate_fICH)) & MI==0 & ST == 0 & cycle == `c'
replace MIE=1 if inrange(rand,rate_otherdeath,rate_nfMI) & MI== 0 & ST == 0 & cycle == `c'
replace STE=1 if inrange(rand,rate_nfMI,rate_nfICH) & MI== 0 & ST == 0 & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace ldl = ldl[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace sbp = sbp[_n-1]+0.91 if cycle[_n-1]==`c' & sex == 0
bysort ind (age) : replace sbp = sbp[_n-1]+0.56 if cycle[_n-1]==`c' & sex == 1
bysort ind (age) : replace LLT = LLT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace AHT = AHT[_n-1] if cycle[_n-1]==`c'
foreach var of varlist hdl-lsi LLT AHT {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand
}
}
gen LPAT=.
save modend0, replace
texdoc stlog close

/***
\color{black}

\subsubsection{Model validation}

Before moving on to the intervention, we should test that this
model more or less approximates reality. To do this,
we will compare the model results with those of the actual follow-up
of the UK Biobank participants. While we don't expect perfect 
concordance (as that would require every one of our assumptions to
be correct), we should come close. 

First, I will generate the actual event counts from the UK Biobank that I want to recapitulate:
the incidence of MI, stroke, and death each year (measured in time since
baseline assessment, to match the model).
Then, I will generate the same incidence rates from the model. 

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
use mainset, clear
gen faildate = td(30,9,2021) if ac == "England"
replace faildate = td(31,7,2021) if ac == "Scotland"
replace faildate = td(28,2,2018) if ac == "Wales"
replace faildate = min(dod,faildate)
gen fail = 0
stset faildate, fail(fail==1) entry(da) origin(da) scale(365.25) id(eid)
stsplit yfu, at(0(1)16)
keep eid sex da faildate dod _st-yfu
gen t0 = da+(_t0*365.25)
gen t = da+(_t*365.25)
save MT1_intervals, replace
use All_MI, clear
bysort eid (epist) : gen njm = _n
ta njm
forval i = 1/8 {
preserve
keep if njm == `i'
save MIn_`i', replace
restore
}
forval i = 1/8 {
use MT1_intervals, clear
merge m:1 eid using MIn_`i'
keep if _merge == 3
keep if inrange(epist,t0,t)
keep eid _t0
gen MI = 1
save MIna_`i', replace
}
clear
forval i = 1/8 {
append using MIna_`i'
}
collapse (sum) MI, by(eid _t0)
save MIa, replace
use All_IS, clear
append using All_ICH
bysort eid (epist) : gen njm = _n
ta njm
forval i = 1/6 {
preserve
keep if njm == `i'
save STn_`i', replace
restore
}
forval i = 1/6 {
use MT1_intervals, clear
merge m:1 eid using STn_`i'
keep if _merge == 3
keep if inrange(epist,t0,t)
keep eid _t0
gen ST = 1
save STna_`i', replace
}
clear
forval i = 1/6 {
append using STna_`i'
}
collapse (sum) ST, by(eid _t0)
save STa, replace
use mainset, clear
keep if chddeath==1
keep eid chddeath
save chddeath, replace
use mainset, clear
keep if isdeath==1 | ichdeath==1
gen stdeath = 1
keep eid stdeath
save stdeath, replace
use MT1_intervals, clear
merge 1:1 eid _t0 using MIa
drop _merge
merge 1:1 eid _t0 using STa
drop _merge
merge m:1 eid using chddeath
drop _merge
merge m:1 eid using stdeath
drop _merge
bysort eid (_t) : replace MI = 1 if _n==_N & chddeath==1
bysort eid (_t) : replace ST = 1 if _n==_N & stdeath==1
gen DT = 1 if faildate == dod
gen PY = _t-_t0
collapse (sum) MI ST DT PY, by(yfu)
gen MIa = 1000*MI/PY
gen STa = 1000*ST/PY
gen DTa = 1000*DT/PY
drop PY
drop if yfu > 10
save MT1a, replace
use modend0, clear
gen PY = 1 if DT == 0
replace PY = 0.5 if DTE==1
collapse (sum) MIE STE DTE PY, by(cycle) 
rename cycle yfu
merge 1:1 yfu using MT1a, keep(3) nogen
gen MIm = 1000*MIE/PY
gen STm = 1000*STE/PY
gen DTm = 1000*DTE/PY
save MT1am, replace
texdoc stlog close
texdoc stlog, cmdlog
use MT1am, clear
twoway ///
(scatter MIa yfu, col(blue) msymbol(O)) ///
(scatter MIm yfu, col(dknavy) msymbol(S)) ///
(scatter STa yfu, col(red) msymbol(O)) ///
(scatter STm yfu, col(cranberry) msymbol(S)) ///
(scatter DTa yfu, col(green) msymbol(O)) ///
(scatter DTm yfu, col(dkgreen) msymbol(S)) ///
, graphregion(color(white)) ///
ylabel(0(2)10, angle(0) format(%9.0f)) ///
ytitle("Incidence rate (per 1,000 person-years)") ///
xtitle(Year of follow-up) xlabel(0(1)10) ///
legend(order( ///
3 "Stroke, actual" ///
4 "Stroke, model" ///
1 "MI, actual" ///
2 "MI, model" ///
5 "Death, actual" ///
6 "Death, model" ///
) position(3) cols(1) region(col(none) lcolor(none)))
texdoc graph, label(MT1f) figure(h!) cabove fontface("Liberation Sans") ///
caption(Actual results in the UK Biobank vs. modeled results for the control scenario ///
for the incidence of MI, stroke, and death.)
texdoc stlog close

/***
\color{black}

Figure~\ref{MT1f} shows that our model performs pretty well, given
we only have a random sample of 10,000 and necessarily made a number
of assumptions that won't be reflective of reality (particularly
the assumption that everyone gets treatment concordant with guidelines).

\subsection{Intervention scenario}

This is the same as the intervention scenario, except we add an Lp(a)
test at each screening for those not at high risk.

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
use modstart, clear
quietly {
forval c = 0/44 {
if `c' == 0 | `c' == 5 | `c' == 10 | `c' == 15 | `c' == 20 ///
| `c' == 25 |  `c' == 30 | `c' == 35 | `c' == 40 {
gen tyr = 100*(1-0.9776^(exp( ///
(0.4648*((age-60)/5)) + ///
(0.7744*cs) + ///
(0.3131*((sbp-120)/20)) + ///
(0.1002*(ldl+hdl+0.5-6)) + ///
(-0.2606*((hdl-1.3)/0.5)) + ///
(-0.1088*(cs*(age-60)/5)) + ///
(-0.0277*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0226*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0613*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 0
replace tyr = 100*(1-0.9605^(exp( ///
(0.3742*((age-60)/5)) + ///
(0.6012*cs) + ///
(0.2777*((sbp-120)/20)) + ///
(0.1458*(ldl+hdl+0.5-6)) + ///
(-0.2698*((hdl-1.3)/0.5)) + ///
(-0.0755*(cs*(age-60)/5)) + ///
(-0.0255*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0281*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0426*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 1
if `c' == 0 {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70)
gen LPAT=1 if vhr!=1 & cycle == `c'
replace vhr = 1 if lpa >= 90 & cycle == `c'
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70 | lpa >= 90) & MI == 0 & ST == 0
}
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
gen cumldl=.
gen mcldl=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen ldllog_`ii' = ldl*logf_`ii'
bysort ind (age) : gen cumldllog_`ii' = sum(ldllog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumldl = cumldllog_`ii' if age == `ii'
replace mcldl = cumldllog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumldl
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
gen cumsbp=.
gen mcsbp=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-2.1)/2.1)^(-2) if age <= `ii'
gen sbplog_`ii' = sbp*logf_`ii'
bysort ind (age) : gen cumsbplog_`ii' = sum(sbplog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumsbp = cumsbplog_`ii' if age == `ii'
replace mcsbp = cumsbplog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumsbp
replace mcldl = . if cycle!=`c'
replace mclpa = . if cycle!=`c'
replace mcsbp = . if cycle!=`c'
merge m:1 sex age using aveldl_cal, keep(1 3) nogen
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
merge m:1 sex age using avesbp_cal, keep(1 3) nogen
merge m:1 sex age using DMmod, keep(1 3) nogen
merge m:1 sex age using LSImod, keep(1 3) nogen
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
merge m:1 age sex using INC/`i'
drop _merge errr
rename (rate) (rate_`i')
}
replace rate_t2d = 0 if DM == 1
recast double rate_t2d-rate_nfICH
*replace rate_t2d = rate_t2d*(0.763^(mcldl-aveldl))
replace rate_t2d = rate_t2d*(1.21^(lsi-LSI))
foreach i in nf f {
replace rate_`i'MI=rate_`i'MI*(2.083^(mcldl-aveldl))
replace rate_`i'MI=rate_`i'MI*(1.0054^(mclpa-avelpa))
replace rate_`i'MI=rate_`i'MI*(1.058^(mcsbp-avesbp))
replace rate_`i'MI=rate_`i'MI*(1.43^(lsi-LSI))
replace rate_`i'MI=rate_`i'MI/(1+(0.26*DMP)) if DM == 0
replace rate_`i'MI=1.26*rate_`i'MI/(1+(0.26*DMP)) if DM == 1
replace rate_`i'IS=rate_`i'IS*(1.08^(mcldl-aveldl))
replace rate_`i'IS=rate_`i'IS*(1.0035^(mclpa-avelpa))
replace rate_`i'IS=rate_`i'IS*(1.027^(mcsbp-avesbp))
replace rate_`i'IS=rate_`i'IS*(1.33^(lsi-LSI))
replace rate_`i'IS=rate_`i'IS/(1+(0.74*DMP)) if DM == 0
replace rate_`i'IS=1.74*rate_`i'IS/(1+(0.74*DMP)) if DM == 1
replace rate_`i'ICH=rate_`i'ICH*(1.039^(mcsbp-avesbp))
}
replace rate_blacdeath = rate_blacdeath*(2.52^(lsi-LSI))
replace rate_colcdeath = rate_colcdeath*(1.24^(lsi-LSI))
replace rate_oescdeath = rate_oescdeath*(3.67^(lsi-LSI))
replace rate_kidcdeath = rate_kidcdeath*(1.69^(lsi-LSI))
replace rate_luncdeath = rate_luncdeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_luncdeath = rate_luncdeath*(37.6) if lsi-LSI > 0.694*2
replace rate_ovacdeath = rate_ovacdeath*(1.27^(lsi-LSI))
replace rate_pancdeath = rate_pancdeath*(2.13^(lsi-LSI))
replace rate_pneudeath = rate_pneudeath*(1.016^(mcsbp-avesbp))
replace rate_pneudeath = rate_pneudeath*(4.03^(lsi-LSI))
replace rate_copddeath = rate_copddeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_copddeath = rate_copddeath*(37.6) if lsi-LSI > 0.694*2
replace rate_alsdeath = rate_alsdeath*(1.09^(mcldl-aveldl))
replace rate_pddeath = rate_pddeath*(0.48^(lsi-LSI))
recode rate_ovacdeath .=0
merge m:1 sex MI ST age using pevtp, keep(1 3) nogen
sort ind age
gen ratesum0 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace ratesum0 = ratesum0+`var' if MI == 0 & ST == 0
}
gen tpsum0 = 1-exp(-ratesum0)
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = tpsum0*`var'/ratesum0 if MI == 0 & ST == 0
}
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = `var'+`var1' if MI == 0 & ST == 0
local var1 = "`var'"
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,rate_fMI) | inrange(rand,rate_nfMI,rate_fIS) | inrange(rand,rate_nfIS,rate_fICH)) & MI==0 & ST == 0 & cycle == `c'
replace MIE=1 if inrange(rand,rate_otherdeath,rate_nfMI) & MI== 0 & ST == 0 & cycle == `c'
replace STE=1 if inrange(rand,rate_nfMI,rate_nfICH) & MI== 0 & ST == 0 & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace ldl = ldl[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace sbp = sbp[_n-1]+0.91 if cycle[_n-1]==`c' & sex == 0
bysort ind (age) : replace sbp = sbp[_n-1]+0.56 if cycle[_n-1]==`c' & sex == 1
bysort ind (age) : replace LLT = LLT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace AHT = AHT[_n-1] if cycle[_n-1]==`c'
foreach var of varlist hdl-lsi LLT AHT {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT
}
}
save modend1, replace
texdoc stlog close

/***
\color{black}

\clearpage
\subsection{Results}

With that, we can now calculate some results. 
First, it's worth calculating the cumulative incidence
of MI, stroke, CVD, and death under both conditions to determine
the effectiveness of the intervention.

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
forval ii = 0/1 {
use modend`ii', clear
drop if cycle ==.
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
gen CVD1 = 1 if MI1 == 1 | ST1 == 1
collapse (sum) MI1 ST1 CVD1 DTE, by(cycle)
rename DTE DT1
replace cycle = cycle+1
expand 2 if cycle == 1
bysort cycle : replace cycle = 0 if _n == 1 & cycle == 1
foreach i in MI ST CVD DT {
bysort cycle : replace `i' = 0 if cycle == 0
gen `i' = sum(`i'1)/100
}
gen a = `ii'
save cuminc_`ii', replace
}
clear
append using cuminc_0 cuminc_1
rename ST Stroke
rename DT Death
foreach i in MI Stroke CVD Death {
if "`i'" == "Death" {
local ylab = "0(10)40"
}
else {
local ylab = "0(2)14"
}
twoway /// 
(line `i' cycle if a == 0, col(dknavy)) ///
(line `i' cycle if a == 1, col(magenta)) ///
, graphregion(color(white)) ///
ylabel(`ylab', angle(0) format(%9.0f)) ///
ytitle("Cumulative incidence (%)") ///
xtitle(Model cycle) xlabel(0(5)45) ///
legend(order( ///
1 "Control" ///
2 "Intervention" ///
) position(11) cols(1) ring(0) region(col(none) lcolor(none))) ///
title(`i', placement(west) size(medium) col(black))
graph save "Graph" GPH/cuminc_`i', replace
}
texdoc stlog close
texdoc stlog, cmdlog
graph combine ///
GPH/cuminc_MI.gph ///
GPH/cuminc_Stroke.gph ///
GPH/cuminc_CVD.gph ///
GPH/cuminc_Death.gph ///
, graphregion(color(white)) cols(2) altshrink xsize(5)
texdoc graph, label(cumincf) figure(h!) cabove fontface("Liberation Sans") ///
caption(Cumulative incidence of MI, stroke, CVD, and death in the control ///
and invervention scenarios. Study 1.)
texdoc stlog close
texdoc stlog, cmdlog nodo
quietly {
forval c = 1/2 {
forval i = 0/1 {
use modend`i', clear
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
sort ind age
gen LPATT=1 if LPAT==1 & lpa >= 90
keep if cycle!=.
if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
}
sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.


if `c' == 1 {
gen double MIOHSHC = MIOHS*6222
gen double STOHSHC = STOHS*4388
gen double DMOHSHC = DMOHS*3588
gen double MISHSHC =MISHS*6222
gen double MIDHSHC = MIDHS*8870
gen double STDHSHC = STDHS*8870
gen double MSDHSHC =MSDHS*8870
gen double ACMIC = 14434 if MIE == 1 & DTE == .
replace ACMIC = 3363 if MIE == 1 & DTE == 1
gen double ACSTC = 15659 if STE == 1 & DTE ==.
replace ACSTC = 13154 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+200 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+200+143+212 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}
if `c' == 2 {
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}
gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}
gen N = 1 if cycle == 0
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save tabres_`i'_`c', replace
}
use tabres_0_`c', clear
merge 1:1 _n using tabres_1_`c', nogen
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 41
replace stat = "SICER" if _n == 42
replace val0 = . if _n>40
replace val1 = . if _n>40
replace diff = diff[38]/diff[37] if _n==41
replace diff = diff[40]/diff[37] if _n==42
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Incident MI (N)" if _n == 4
replace row = "Total MIs (N)" if _n == 5
replace row = "Incident stroke (N)" if _n == 6
replace row = "Total strokes (N)" if _n == 7
replace row = "Deaths (N)" if _n == 8
replace row = "YLL no CVD or diabetes" if _n == 9
replace row = "YLL with MI" if _n == 10
replace row = "YLL with stroke" if _n == 11
replace row = "YLL with diabetes" if _n == 12
replace row = "YLL with MI and stroke" if _n == 13
replace row = "YLL with MI and diabetes" if _n == 14
replace row = "YLL with stroke and diabetes" if _n == 15
replace row = "YLL with MI, stroke, and diabetes" if _n == 16
replace row = "QALY with no CVD or diabetes" if _n == 17
replace row = "QALY with MI" if _n == 18
replace row = "QALY with stroke" if _n == 19
replace row = "QALY with diabetes" if _n == 20
replace row = "QALY with MI and stroke" if _n == 21
replace row = "QALY with MI and diabetes" if _n == 22
replace row = "QALY with stroke and diabetes" if _n == 23
replace row = "QALY with MI, stroke, and diabetes" if _n == 24
replace row = "Chronic MI healthcare costs (\textsterling)" if _n == 25
replace row = "Chronic stroke healthcare costs (\textsterling)" if _n == 26
replace row = "Chronic diabetes healthcare costs (\textsterling)" if _n == 27
replace row = "Chronic MI and stroke healthcare costs (\textsterling)" if _n == 28
replace row = "Chronic MI and diabetes healthcare costs (\textsterling)" if _n == 29
replace row = "Chronic stroke and diabetes healthcare costs (\textsterling)" if _n == 30
replace row = "Chronic MI, diabetes, and stroke healthcare costs (\textsterling)" if _n == 31
replace row = "Acute MI costs (\textsterling)" if _n == 32
replace row = "Acute stroke costs (\textsterling)" if _n == 33
replace row = "Medication costs (\textsterling)" if _n == 34
replace row = "Lp(a) test costs (\textsterling)" if _n == 35
replace row = "Total YLL" if _n == 36
replace row = "Total QALY" if _n == 37
replace row = "Total healthcare costs (\textsterling)" if _n == 38
replace row = "Total indirect costs (\textsterling)" if _n == 39
replace row = "Total costs (\textsterling)" if _n == 40
replace row = "ICER (\textsterling \ per QALY)" if _n == 41
replace row = "SICER (\textsterling \ per QALY)" if _n == 42
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
export delimited using CSV/BCrestab_`c'.csv, delimiter(":") novarnames replace
use tabres_0_`c', clear
merge 1:1 _n using tabres_1_`c', nogen
drop if inrange(_n,9,24)
replace val0 = val0[9]+val0[10]+val0[11]+val0[12]+val0[13]+val0[14]+val0[15] if _n == 15
replace val0 = val0[16]+val0[17] if _n == 17
replace val1 = val1[9]+val1[10]+val1[11]+val1[12]+val1[13]+val1[14]+val1[15] if _n == 15
replace val1 = val1[16]+val1[17] if _n == 17
drop if inrange(_n,9,14) | _n == 16
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 18
replace stat = "SICER" if _n == 19
replace val0 = . if _n>17
replace val1 = . if _n>17
replace diff = diff[15]/diff[14] if _n==18
replace diff = diff[17]/diff[14] if _n==19
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Incident MI (N)" if _n == 4
replace row = "Total MIs (N)" if _n == 5
replace row = "Incident stroke (N)" if _n == 6
replace row = "Total strokes (N)" if _n == 7
replace row = "Deaths (N)" if _n == 8
replace row = "Chronic healthcare costs (\textsterling)" if _n == 9
replace row = "Acute event costs (\textsterling)" if _n == 10
replace row = "Medication costs (\textsterling)" if _n == 11
replace row = "Lp(a) test costs (\textsterling)" if _n == 12
replace row = "Total YLL" if _n == 13
replace row = "Total QALY" if _n == 14
replace row = "Total healthcare costs (\textsterling)" if _n == 15
replace row = "Total indirect costs (\textsterling)" if _n == 16
replace row = "Total costs (\textsterling)" if _n == 17
replace row = "ICER (\textsterling \ per QALY)" if _n == 18
replace row = "SICER (\textsterling \ per QALY)" if _n == 19
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
save tempsumtab_`c', replace
export delimited using CSV/BCrestabsum_`c'.csv, delimiter(":") novarnames replace
}
clear
append using tempsumtab_1 tempsumtab_2
drop if inrange(_n,20,27)
gen C = "Overall" if _n == 1
replace C = "Australia" if _n == 9
replace C = "UK" if _n == 20
order C
export delimited using CSV/BCrestabsumpaper.csv, delimiter(":") novarnames replace
}
texdoc stlog close

/***
\color{black}

The intervention is only slightly effective for preventing MI,
and far less so for stroke (Figure~\ref{cumincf}). This is not surprising given how
few people actually receive therapy in response to Lp(a) testing (Table~\ref{BCDtaba}). 

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Study 1. Australia.}
    \label{BCDtaba}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Study 1. UK.}
    \label{BCDtabu}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Study 1. Australia.}
    \label{BCDtabfa}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestab_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Study 1. UK.}
    \label{BCDtabfu}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestab_2.csv}
  \end{center}
\end{table}


\clearpage
\subsection{Results by age and sex.}

It's worth repeating the results by age and sex. 

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
quietly {
forval c = 1/2 {
forval a = 1/5 {
forval i = 0/1 {
use modend`i', clear
gen dage = age if cycle == 0
bysort ind (age) : egen daage = min(dage)
if `a' == 1 {
keep if sex == 0
}
if `a' == 2 {
keep if sex == 1
}
if `a' == 3 {
keep if inrange(daage,40,49)
}
if `a' == 4 {
keep if inrange(daage,50,59)
}
if `a' == 5 {
keep if inrange(daage,60,69)
}
drop dage daage
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
sort ind age
gen LPATT=1 if LPAT==1 & lpa >= 90
keep if cycle!=.
if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
}
sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.


if `c' == 1 {
gen double MIOHSHC = MIOHS*6222
gen double STOHSHC = STOHS*4388
gen double DMOHSHC = DMOHS*3588
gen double MISHSHC =MISHS*6222
gen double MIDHSHC = MIDHS*8870
gen double STDHSHC = STDHS*8870
gen double MSDHSHC =MSDHS*8870
gen double ACMIC = 14434 if MIE == 1 & DTE == .
replace ACMIC = 3363 if MIE == 1 & DTE == 1
gen double ACSTC = 15659 if STE == 1 & DTE ==.
replace ACSTC = 13154 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+200 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+200+143+212 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}
if `c' == 2 {
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}






gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.



if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}




gen N = 1 if cycle == 0
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save tabres_`i'_`a'_`c', replace
}
use tabres_0_`a'_`c', clear
merge 1:1 _n using tabres_1_`a'_`c', nogen
drop if inrange(_n,9,24)
replace val0 = val0[9]+val0[10]+val0[11]+val0[12]+val0[13]+val0[14]+val0[15] if _n == 15
replace val0 = val0[16]+val0[17] if _n == 17
replace val1 = val1[9]+val1[10]+val1[11]+val1[12]+val1[13]+val1[14]+val1[15] if _n == 15
replace val1 = val1[16]+val1[17] if _n == 17
drop if inrange(_n,9,14) | _n == 16
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 18
replace stat = "SICER" if _n == 19
replace val0 = . if _n>17
replace val1 = . if _n>17
replace diff = diff[15]/diff[14] if _n==18
replace diff = diff[17]/diff[14] if _n==19
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Incident MI (N)" if _n == 4
replace row = "Total MIs (N)" if _n == 5
replace row = "Incident stroke (N)" if _n == 6
replace row = "Total strokes (N)" if _n == 7
replace row = "Deaths (N)" if _n == 8
replace row = "Chronic healthcare costs (\textsterling)" if _n == 9
replace row = "Acute event costs (\textsterling)" if _n == 10
replace row = "Medication costs (\textsterling)" if _n == 11
replace row = "Lp(a) test costs (\textsterling)" if _n == 12
replace row = "Total YLL" if _n == 13
replace row = "Total QALY" if _n == 14
replace row = "Total healthcare costs (\textsterling)" if _n == 15
replace row = "Total indirect costs (\textsterling)" if _n == 16
replace row = "Total costs (\textsterling)" if _n == 17
replace row = "ICER (\textsterling \ per QALY)" if _n == 18
replace row = "SICER (\textsterling \ per QALY)" if _n == 19
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
export delimited using CSV/BCrestabsum_`a'_`c'.csv, delimiter(":") novarnames replace
}
}
}
texdoc stlog close

/***
\color{black}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, females. Study 1. Australia.}
    \label{BCDtaba1a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_1_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, males. Study 1. Australia.}
    \label{BCDtaba2a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_2_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 40-49 at baseline. Study 1. Australia.}
    \label{BCDtaba3a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_3_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 50-59 at baseline. Study 1. Australia.}
    \label{BCDtaba4a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_4_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 60-69 at baseline. Study 1. Australia.}
    \label{BCDtaba5a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_5_1.csv}
  \end{center}
\end{table}



\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, females. Study 1. UK.}
    \label{BCDtaba1u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_1_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, males. Study 1. UK.}
    \label{BCDtaba2u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_2_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 40-49 at baseline. Study 1. UK.}
    \label{BCDtaba3u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_3_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 50-59 at baseline. Study 1. UK.}
    \label{BCDtaba4u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_4_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 60-69 at baseline. Study 1. UK.}
    \label{BCDtaba5u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_5_2.csv}
  \end{center}
\end{table}



\clearpage
\section{Base-case: study 2}

This model will be similar to the last, except that this time
we must factor in the effect of Lp(a) lowering for secondary
prevention of CVD. We will assume that the risk of CVD following an event
is also proportional to the cumulative mean Lp(a) over the lifetime. 
However, clearly this population is higher risk, so the baseline
rate of CVD will be as for the secondary prevention population. 

Because this model includes the secondary prevention population, we will 
also run it separately for people in the primary and secondary prevention
populations. For the primary prevention population, we will use the same model
starting population as above; for secondary prevention, we will define a new
model population.


\color{Blue4}
***/

texdoc stlog, cmdlog nodo
use fullset, clear
keep eid sex da ac dob dod ucod chddeath-otherdeath DMC ldl hdl LLT lpa lpar sbp AHT LSI dursmk tsc ncig mid std
drop if lpa ==.
gen daage = round((da-dob)/365.25,1)
keep if inrange(daage,40,69)
keep if mid < da | std < da
set seed 1311
gen rand = uniform()
sort rand
keep if _n<=10000
gen ind = _n
expand 85
bysort ind : gen age = _n-1
replace lpa =. if age > daage
replace LSI = . if age!=daage
gen cs = 1 if tsc == 0
gen ps = 1 if tsc != 0 & tsc !=.
bysort ind (age) : replace dursmk = dursmk[_n-1]+1 if age > daage & cs == 1
bysort ind (age) : replace tsc = tsc[_n-1]+1 if age > daage & ps == 1
replace LSI = (1-(0.5^(dursmk/18)))*(0.5^(tsc/18))*ln(ncig+1) if cs == 1 | ps == 1
replace LSI = 0 if ps == . & cs == .
replace LSI = . if age < daage
gen agesta = daage-dursmk
gen agesto = daage-tsc if tsc!=0
replace dursmk = age-agesta if tsc != 0
replace tsc = age-agesto
gen cycle = age-daage if age >= daage
gen DM = 0 if cycle==0
replace DM = 1 if DMC == 1 & cycle==0
gen MI = 0 if cycle==0
replace MI = 1 if mid < da & cycle == 0
gen ST = 0 if cycle==0
replace ST = 1 if std < da & cycle == 0
gen DT = 0 if cycle==0
gen DME = .
gen MIE = .
gen STE = .
gen DTE = .
rename LSI lsi
save modstartspbloated, replace
keep ind sex lpa lsi rand ind age cycle-DTE
replace rand = uniform()
order ind sex age lpa lsi cycle DM DME MI MIE ST STE DT DTE rand
save modstartsp, replace
forval s = 0/2 {
use modstartspbloated, clear
keep if cycle == 0
drop if sex == `s'
count
matrix A = (r(N),.,.,.,.)
su age, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
count if DM==1
matrix A = (A\r(N),.,.,.,.)
su ldl, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
su lpa, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
count if lpa >= 50
matrix A = (A\r(N),.,.,.,.)
count if lpa >= 70
matrix A = (A\r(N),.,.,.,.)
count if lpa >= 90
matrix A = (A\r(N),.,.,.,.)
count if lpa >= 110
matrix A = (A\r(N),.,.,.,.)
su sbp, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
su lsi, detail
matrix A = (A\r(min),r(p25),r(p50),r(p75),r(max))
mat A`s' = (J(11,1,`s'),A)
}
mat A = (A0\A1\A2)
clear
svmat double A
gen njm = _n
bysort A1 (njm) : gen perc = 100*A2/A2[1] if _n == 3 | inrange(_n,6,9)
forval i = 2/6 {
bysort A1 (njm) : replace A`i' = (A`i'*2.18)-3.83 if _n == 5
replace A`i' = 0 if A`i'<0
}
tostring A2-A6, gen(B2 B3 B4 B5 B6) format(%9.0fc) force
tostring A2 A3 A4 A5 A6 perc, replace format(%9.1f) force
bysort A1 (njm) : gen A = B2 if _n == 1
bysort A1 (njm) : replace A = B2 + " (" + perc + "\%)" if _n == 3 | inrange(_n,6,9)
bysort A1 (njm) : replace A = B4 + " (" + B3 + ", " + B5 + "; " + B2 + ", " + B6 + ")" if _n == 2 | _n == 10
bysort A1 (njm) : replace A = A4 + " (" + A3 + ", " + A5 + "; " + A2 + ", " + A6 + ")" if A==""
bysort A1 (njm) : gen row = _n
keep A1 A row
reshape wide A, j(A1) i(row)
drop row
gen R1 = "N" if _n == 1
replace R1 = "Age" if _n == 2
replace R1 = "N (\%) with diabetes" if _n == 3
replace R1 = "LDL-C (mmol/L)" if _n == 4
replace R1 = "Lp(a) (nmol/L)" if _n == 5
replace R1 = "N (\%) with Lp(a) $\geq$105 nmol/L (50 mg/dL)" if _n == 6
replace R1 = "N (\%) with Lp(a) $\geq$149 nmol/L (70 mg/dL)" if _n == 7
replace R1 = "N (\%) with Lp(a) $\geq$192 nmol/L (90 mg/dL)" if _n == 8
replace R1 = "N (\%) with Lp(a) $\geq$236 nmol/L (110 mg/dL)" if _n == 9
replace R1 = "SBP (mmHg)" if _n == 10
replace R1 = "LSI" if _n == 11
order R1 A1 A0 A2
export delimited using CSV/popcharsp_MS.csv, delimiter(":") novarnames replace
rename (R1 A1 A0 A2) (v1 v2 v3 v4)
save sppopchar, replace
import delimited using CSV/popchar_MS.csv, delimiter(":") clear
append using sppopchar
gen C = "Primary prevention" if _n == 1
replace C = "Secondary prevention" if _n == 12
order C
export delimited using CSV/popchar_MS2comb.csv, delimiter(":") novarnames replace
texdoc stlog close


/***
\color{black}

Population characteristics for the random sample for the secondary prevention population
are shown in Table~\ref{popcharMStabsp}.

\begin{table}[h!]
  \begin{center}
    \caption{Baseline characteristics for the model starting population, secondary prevention.}
    \label{popcharMStabsp}
	\hspace*{-2cm}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=, column type={l}, text indicator="},
      display columns/1/.style={column name=Females, column type={r}},
      display columns/2/.style={column name=Males, column type={r}},
      display columns/3/.style={column name=Overall, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/popcharsp_MS.csv}
  \end{center}
Numeric variables are presented as median (25th centile, 75th centile; minimum, maximum). \\
Abbreviations: 
LDL-C -- Low density lipoprotein-cholesterol; 
Lp(a) -- Lipoprotein(a); 
SBP -- Systolic blood pressure;
LSI -- Lifetime smoking index.
\end{table}


\color{Blue4}
***/

texdoc stlog, cmdlog nodo
use modstart, clear
set seed 78932173
replace rand = runiform()
save modstart2, replace
quietly {
forval m = 0/1 {
use modstart2, clear
gen LPAT=.
gen LPT=.
forval c = 0/44 {
if `c' == 0 | `c' == 5 | `c' == 10 | `c' == 15 | `c' == 20 ///
| `c' == 25 |  `c' == 30 | `c' == 35 | `c' == 40 {
gen tyr = 100*(1-0.9776^(exp( ///
(0.4648*((age-60)/5)) + ///
(0.7744*cs) + ///
(0.3131*((sbp-120)/20)) + ///
(0.1002*(ldl+hdl+0.5-6)) + ///
(-0.2606*((hdl-1.3)/0.5)) + ///
(-0.1088*(cs*(age-60)/5)) + ///
(-0.0277*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0226*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0613*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 0
replace tyr = 100*(1-0.9605^(exp( ///
(0.3742*((age-60)/5)) + ///
(0.6012*cs) + ///
(0.2777*((sbp-120)/20)) + ///
(0.1458*(ldl+hdl+0.5-6)) + ///
(-0.2698*((hdl-1.3)/0.5)) + ///
(-0.0755*(cs*(age-60)/5)) + ///
(-0.0255*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0281*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0426*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 1
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
replace vhr = 1 if MI == 1 | ST == 1
if `m' == 1 {
replace LPAT=1 if vhr==1 & cycle == `c'
replace LPT=1 if lpa >= 90 & LPAT==1 & cycle == `c' & vhr == 1
bysort ind (age) : replace lpa = lpa*(1-0.975) if cycle == `c' & LPT == 1 & LPT[_n-1]!=1
}
gen cumldl=.
gen mcldl=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen ldllog_`ii' = ldl*logf_`ii'
bysort ind (age) : gen cumldllog_`ii' = sum(ldllog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumldl = cumldllog_`ii' if age == `ii'
replace mcldl = cumldllog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumldl
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
gen cumsbp=.
gen mcsbp=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-2.1)/2.1)^(-2) if age <= `ii'
gen sbplog_`ii' = sbp*logf_`ii'
bysort ind (age) : gen cumsbplog_`ii' = sum(sbplog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumsbp = cumsbplog_`ii' if age == `ii'
replace mcsbp = cumsbplog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumsbp
replace mcldl = . if cycle!=`c'
replace mclpa = . if cycle!=`c'
replace mcsbp = . if cycle!=`c'
merge m:1 sex age using aveldl_cal, keep(1 3) nogen
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
merge m:1 sex age using avesbp_cal, keep(1 3) nogen
merge m:1 sex age using DMmod, keep(1 3) nogen
merge m:1 sex age using LSImod, keep(1 3) nogen
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
merge m:1 age sex using INC/`i'
drop _merge errr
rename (rate) (rate_`i')
}
replace rate_t2d = 0 if DM == 1
recast double rate_t2d-rate_nfICH
merge m:1 sex MI ST age using pevtp, keep(1 3) nogen
sort ind age
*replace rate_t2d = rate_t2d*(0.763^(mcldl-aveldl))
replace rate_t2d = rate_t2d*(1.21^(lsi-LSI))
foreach i in nf f {
replace rate_`i'MI=rate_`i'MI*(2.083^(mcldl-aveldl))
replace rate_`i'MI=rate_`i'MI*(1.0054^(mclpa-avelpa))
replace rate_`i'MI=rate_`i'MI*(1.058^(mcsbp-avesbp))
replace rate_`i'MI=rate_`i'MI*(1.43^(lsi-LSI))
replace rate_`i'MI=rate_`i'MI/(1+(0.26*DMP)) if DM == 0
replace rate_`i'MI=1.26*rate_`i'MI/(1+(0.26*DMP)) if DM == 1
replace rate_`i'IS=rate_`i'IS*(1.08^(mcldl-aveldl))
replace rate_`i'IS=rate_`i'IS*(1.0035^(mclpa-avelpa))
replace rate_`i'IS=rate_`i'IS*(1.027^(mcsbp-avesbp))
replace rate_`i'IS=rate_`i'IS*(1.33^(lsi-LSI))
replace rate_`i'IS=rate_`i'IS/(1+(0.74*DMP)) if DM == 0
replace rate_`i'IS=1.74*rate_`i'IS/(1+(0.74*DMP)) if DM == 1
replace rate_`i'ICH=rate_`i'ICH*(1.039^(mcsbp-avesbp))
replace rate`i'MI=rate`i'MI*(1.0054^(mclpa-avelpa))
replace rate`i'S=rate`i'S*(1.0035^(mclpa-avelpa))
}
replace rate_blacdeath = rate_blacdeath*(2.52^(lsi-LSI))
replace rate_colcdeath = rate_colcdeath*(1.24^(lsi-LSI))
replace rate_oescdeath = rate_oescdeath*(3.67^(lsi-LSI))
replace rate_kidcdeath = rate_kidcdeath*(1.69^(lsi-LSI))
replace rate_luncdeath = rate_luncdeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_luncdeath = rate_luncdeath*(37.6) if lsi-LSI > 0.694*2
replace rate_ovacdeath = rate_ovacdeath*(1.27^(lsi-LSI))
replace rate_pancdeath = rate_pancdeath*(2.13^(lsi-LSI))
replace rate_pneudeath = rate_pneudeath*(1.016^(mcsbp-avesbp))
replace rate_pneudeath = rate_pneudeath*(4.03^(lsi-LSI))
replace rate_copddeath = rate_copddeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_copddeath = rate_copddeath*(37.6) if lsi-LSI > 0.694*2
replace rate_alsdeath = rate_alsdeath*(1.09^(mcldl-aveldl))
replace rate_pddeath = rate_pddeath*(0.48^(lsi-LSI))
recode rate_ovacdeath .=0
gen ratesum0 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace ratesum0 = ratesum0+`var' if MI == 0 & ST == 0
}
gen tpsum0 = 1-exp(-ratesum0)
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = tpsum0*`var'/ratesum0 if MI == 0 & ST == 0
}
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = `var'+`var1' if MI == 0 & ST == 0
local var1 = "`var'"
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,rate_fMI) | inrange(rand,rate_nfMI,rate_fIS) | inrange(rand,rate_nfIS,rate_fICH)) & MI==0 & ST == 0 & cycle == `c'
replace MIE=1 if inrange(rand,rate_otherdeath,rate_nfMI) & MI== 0 & ST == 0 & cycle == `c'
replace STE=1 if inrange(rand,rate_nfMI,rate_nfICH) & MI== 0 & ST == 0 & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace ldl = ldl[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace sbp = sbp[_n-1]+0.91 if cycle[_n-1]==`c' & sex == 0
bysort ind (age) : replace sbp = sbp[_n-1]+0.56 if cycle[_n-1]==`c' & sex == 1
bysort ind (age) : replace LLT = LLT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace AHT = AHT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace LPT = LPT[_n-1] if cycle[_n-1]==`c'

foreach var of varlist hdl-lsi LLT AHT LPT {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT LPT
}
save modend2_`m', replace
}
forval m = 0/1 {
use modstartsp, clear
if `m' == 0 {
gen LPAT=.
gen LPT=.
}
if `m' == 1 {
gen LPAT=1 if cycle == 0
gen LPT=1 if lpa >= 90 & cycle == 0
}
forval c = 0/44 {
if `m' == 1 {
bysort ind (age) : replace lpa = lpa*(1-0.975) if cycle == `c' & LPT == 1 & LPT[_n-1]!=1
}
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
replace mclpa = . if cycle!=`c'
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
merge m:1 sex age using LSImod, keep(1 3) nogen
merge m:1 age sex using INC/t2d
drop _merge errr
rename (rate) (rate_t2d)
replace rate_t2d = 0 if DM == 1
recast double rate_t2d
merge m:1 sex MI ST age using pevtp, keep(1 3) nogen
replace rate_t2d = rate_t2d*(1.21^(lsi-LSI))
foreach i in nf f {
replace rate`i'MI=rate`i'MI*(1.0054^(mclpa-avelpa))
replace rate`i'S=rate`i'S*(1.0035^(mclpa-avelpa))
}
sort ind age
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
foreach var of varlist lpa lsi {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT LPT
}
save modendsp`m', replace
}
}
texdoc stlog close

/***
\color{black}

\clearpage
\subsection{Results}

First, the cumulative incidence
of MI, stroke, CVD, and death under both conditions to determine
the effectiveness of the intervention.

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
forval ii = 0/1 {
use modend2_`ii', clear
drop if cycle ==.
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
gen CVD1 = 1 if MI1 == 1 | ST1 == 1
collapse (sum) MI1 ST1 CVD1 DTE, by(cycle)
rename DTE DT1
replace cycle = cycle+1
expand 2 if cycle == 1
bysort cycle : replace cycle = 0 if _n == 1 & cycle == 1
foreach i in MI ST CVD DT {
bysort cycle : replace `i' = 0 if cycle == 0
gen `i' = sum(`i'1)/100
}
gen a = `ii'
save cuminc2_`ii', replace
}
clear
append using cuminc2_0 cuminc2_1
rename ST Stroke
rename DT Death
foreach i in MI Stroke CVD Death {
if "`i'" == "Death" {
local ylab = "0(10)40"
}
else {
local ylab = "0(2)14"
}
twoway /// 
(line `i' cycle if a == 0, col(dknavy)) ///
(line `i' cycle if a == 1, col(magenta)) ///
, graphregion(color(white)) ///
ylabel(`ylab', angle(0) format(%9.0f)) ///
ytitle("Cumulative incidence (%)") ///
xtitle(Model cycle) xlabel(0(5)45) ///
legend(order( ///
1 "Control" ///
2 "Intervention" ///
) position(11) cols(1) ring(0) region(col(none) lcolor(none))) ///
title(`i', placement(west) size(medium) col(black))
graph save "Graph" GPH/cuminc2_`i', replace
}
texdoc stlog close
texdoc stlog, cmdlog
graph combine ///
GPH/cuminc2_MI.gph ///
GPH/cuminc2_Stroke.gph ///
GPH/cuminc2_CVD.gph ///
GPH/cuminc2_Death.gph ///
, graphregion(color(white)) cols(2) altshrink xsize(5)
texdoc graph, label(cumincf2) figure(h!) cabove fontface("Liberation Sans") ///
caption(Cumulative incidence of MI, stroke, CVD, and death in the control ///
and invervention scenarios. Study 2.)
texdoc stlog close
texdoc stlog, cmdlog nodo
quietly {
forval c = 1/2 {
forval ii = 0/1 {
use modend2_`ii', clear
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.
if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
}
sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.


if `c' == 1 {
gen double MIOHSHC = MIOHS*6222
gen double STOHSHC = STOHS*4388
gen double DMOHSHC = DMOHS*3588
gen double MISHSHC =MISHS*6222
gen double MIDHSHC = MIDHS*8870
gen double STDHSHC = STDHS*8870
gen double MSDHSHC =MSDHS*8870
gen double ACMIC = 14434 if MIE == 1 & DTE == .
replace ACMIC = 3363 if MIE == 1 & DTE == 1
gen double ACSTC = 15659 if STE == 1 & DTE ==.
replace ACSTC = 13154 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+200 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+200+143+212 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
replace DRUGSHC = DRUGSHC+4360 if LPT == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}
if `c' == 2 {
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}




gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.

if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}




gen N = 1 if cycle == 0
save threshtemp_`ii'_`c', replace
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`ii'
save tabres2_`ii'_`c', replace
}
use tabres2_0_`c', clear
merge 1:1 _n using tabres2_1_`c', nogen
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 41
replace stat = "SICER" if _n == 42
replace val0 = . if _n>40
replace val1 = . if _n>40
replace diff = diff[38]/diff[37] if _n==41
replace diff = diff[40]/diff[37] if _n==42
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Incident MI (N)" if _n == 4
replace row = "Total MIs (N)" if _n == 5
replace row = "Incident stroke (N)" if _n == 6
replace row = "Total strokes (N)" if _n == 7
replace row = "Deaths (N)" if _n == 8
replace row = "YLL no CVD or diabetes" if _n == 9
replace row = "YLL with MI" if _n == 10
replace row = "YLL with stroke" if _n == 11
replace row = "YLL with diabetes" if _n == 12
replace row = "YLL with MI and stroke" if _n == 13
replace row = "YLL with MI and diabetes" if _n == 14
replace row = "YLL with stroke and diabetes" if _n == 15
replace row = "YLL with MI, stroke, and diabetes" if _n == 16
replace row = "QALY with no CVD or diabetes" if _n == 17
replace row = "QALY with MI" if _n == 18
replace row = "QALY with stroke" if _n == 19
replace row = "QALY with diabetes" if _n == 20
replace row = "QALY with MI and stroke" if _n == 21
replace row = "QALY with MI and diabetes" if _n == 22
replace row = "QALY with stroke and diabetes" if _n == 23
replace row = "QALY with MI, stroke, and diabetes" if _n == 24
replace row = "Chronic MI healthcare costs (\textsterling)" if _n == 25
replace row = "Chronic stroke healthcare costs (\textsterling)" if _n == 26
replace row = "Chronic diabetes healthcare costs (\textsterling)" if _n == 27
replace row = "Chronic MI and stroke healthcare costs (\textsterling)" if _n == 28
replace row = "Chronic MI and diabetes healthcare costs (\textsterling)" if _n == 29
replace row = "Chronic stroke and diabetes healthcare costs (\textsterling)" if _n == 30
replace row = "Chronic MI, diabetes, and stroke healthcare costs (\textsterling)" if _n == 31
replace row = "Acute MI costs (\textsterling)" if _n == 32
replace row = "Acute stroke costs (\textsterling)" if _n == 33
replace row = "Medication costs (\textsterling)" if _n == 34
replace row = "Lp(a) test costs (\textsterling)" if _n == 35
replace row = "Total YLL" if _n == 36
replace row = "Total QALY" if _n == 37
replace row = "Total healthcare costs (\textsterling)" if _n == 38
replace row = "Total indirect costs (\textsterling)" if _n == 39
replace row = "Total costs (\textsterling)" if _n == 40
replace row = "ICER (\textsterling \ per QALY)" if _n == 41
replace row = "SICER (\textsterling \ per QALY)" if _n == 42
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
export delimited using CSV/BCrestab2_`c'.csv, delimiter(":") novarnames replace
use tabres2_0_`c', clear
merge 1:1 _n using tabres2_1_`c', nogen
drop if inrange(_n,9,24)
replace val0 = val0[9]+val0[10]+val0[11]+val0[12]+val0[13]+val0[14]+val0[15] if _n == 15
replace val0 = val0[16]+val0[17] if _n == 17
replace val1 = val1[9]+val1[10]+val1[11]+val1[12]+val1[13]+val1[14]+val1[15] if _n == 15
replace val1 = val1[16]+val1[17] if _n == 17
drop if inrange(_n,9,14) | _n == 16
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 18
replace stat = "SICER" if _n == 19
replace val0 = . if _n>17
replace val1 = . if _n>17
replace diff = diff[15]/diff[14] if _n==18
replace diff = diff[17]/diff[14] if _n==19
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Incident MI (N)" if _n == 4
replace row = "Total MIs (N)" if _n == 5
replace row = "Incident stroke (N)" if _n == 6
replace row = "Total strokes (N)" if _n == 7
replace row = "Deaths (N)" if _n == 8
replace row = "Chronic healthcare costs (\textsterling)" if _n == 9
replace row = "Acute event costs (\textsterling)" if _n == 10
replace row = "Medication costs (\textsterling)" if _n == 11
replace row = "Lp(a) test costs (\textsterling)" if _n == 12
replace row = "Total YLL" if _n == 13
replace row = "Total QALY" if _n == 14
replace row = "Total healthcare costs (\textsterling)" if _n == 15
replace row = "Total indirect costs (\textsterling)" if _n == 16
replace row = "Total costs (\textsterling)" if _n == 17
replace row = "ICER (\textsterling \ per QALY)" if _n == 18
replace row = "SICER (\textsterling \ per QALY)" if _n == 19
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
save tempsumtab2_`c', replace
export delimited using CSV/BCrestabsum2_`c'.csv, delimiter(":") novarnames replace
forval i = 0/1 {
use modendsp`i', clear
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.
if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
}
sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.



if `c' == 1 {
gen double MIOHSHC = MIOHS*6222
gen double STOHSHC = STOHS*4388
gen double DMOHSHC = DMOHS*3588
gen double MISHSHC =MISHS*6222
gen double MIDHSHC = MIDHS*8870
gen double STDHSHC = STDHS*8870
gen double MSDHSHC =MSDHS*8870
gen double ACMIC = 14434 if MIE == 1 & DTE == .
replace ACMIC = 3363 if MIE == 1 & DTE == 1
gen double ACSTC = 15659 if STE == 1 & DTE ==.
replace ACSTC = 13154 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+4360 if LPT == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}


if `c' == 2 {
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}





gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.



if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}



gen N = 1 if cycle == 0
save threshtempsp_`i'_`c', replace
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 38
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save tabressp_`i'_`c', replace
}
use tabressp_0_`c', clear
merge 1:1 _n using tabressp_1_`c', nogen
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 39
replace stat = "SICER" if _n == 40
replace val0 = . if _n>38
replace val1 = . if _n>38
replace diff = diff[36]/diff[35] if _n==39
replace diff = diff[38]/diff[35] if _n==40
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Total MIs (N)" if _n == 4
replace row = "Total strokes (N)" if _n == 5
replace row = "Deaths (N)" if _n == 6
replace row = "YLL no CVD or diabetes" if _n == 7
replace row = "YLL with MI" if _n == 8
replace row = "YLL with stroke" if _n == 9
replace row = "YLL with diabetes" if _n == 10
replace row = "YLL with MI and stroke" if _n == 11
replace row = "YLL with MI and diabetes" if _n == 12
replace row = "YLL with stroke and diabetes" if _n == 13
replace row = "YLL with MI, stroke, and diabetes" if _n == 14
replace row = "QALY with no CVD or diabetes" if _n == 15
replace row = "QALY with MI" if _n == 16
replace row = "QALY with stroke" if _n == 17
replace row = "QALY with diabetes" if _n == 18
replace row = "QALY with MI and stroke" if _n == 19
replace row = "QALY with MI and diabetes" if _n == 20
replace row = "QALY with stroke and diabetes" if _n == 21
replace row = "QALY with MI, stroke, and diabetes" if _n == 22
replace row = "Chronic MI healthcare costs (\textsterling)" if _n == 23
replace row = "Chronic stroke healthcare costs (\textsterling)" if _n == 24
replace row = "Chronic diabetes healthcare costs (\textsterling)" if _n == 25
replace row = "Chronic MI and stroke healthcare costs (\textsterling)" if _n == 26
replace row = "Chronic MI and diabetes healthcare costs (\textsterling)" if _n == 27
replace row = "Chronic stroke and diabetes healthcare costs (\textsterling)" if _n == 28
replace row = "Chronic MI, diabetes, and stroke healthcare costs (\textsterling)" if _n == 29
replace row = "Acute MI costs (\textsterling)" if _n == 30
replace row = "Acute stroke costs (\textsterling)" if _n == 31
replace row = "Medication costs (\textsterling)" if _n == 32
replace row = "Lp(a) test costs (\textsterling)" if _n == 33
replace row = "Total YLL" if _n == 34
replace row = "Total QALY" if _n == 35
replace row = "Total healthcare costs (\textsterling)" if _n == 36
replace row = "Total indirect costs (\textsterling)" if _n == 37
replace row = "Total costs (\textsterling)" if _n == 38
replace row = "ICER (\textsterling \ per QALY)" if _n == 39
replace row = "SICER (\textsterling \ per QALY)" if _n == 40
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
export delimited using CSV/BCrestabsp_`c'.csv, delimiter(":") novarnames replace
use tabressp_0_`c', clear
merge 1:1 _n using tabressp_1_`c', nogen
drop if inrange(_n,7,22)
replace val0 = val0[7]+val0[8]+val0[9]+val0[10]+val0[11]+val0[12]+val0[13] if _n == 13
replace val0 = val0[14]+val0[15] if _n == 15
replace val1 = val1[7]+val1[8]+val1[9]+val1[10]+val1[11]+val1[12]+val1[13] if _n == 13
replace val1 = val1[14]+val1[15] if _n == 15
drop if inrange(_n,7,12) | _n == 14
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 17
replace stat = "SICER" if _n == 18
replace val0 = . if _n>15
replace val1 = . if _n>15
replace diff = diff[13]/diff[12] if _n==16
replace diff = diff[15]/diff[12] if _n==17
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Total MIs (N)" if _n == 4
replace row = "Total strokes (N)" if _n == 5
replace row = "Deaths (N)" if _n == 6
replace row = "Chronic healthcare costs (\textsterling)" if _n == 7
replace row = "Acute event costs (\textsterling)" if _n == 8
replace row = "Medication costs (\textsterling)" if _n == 9
replace row = "Lp(a) test costs (\textsterling)" if _n == 10
replace row = "Total YLL" if _n == 11
replace row = "Total QALY" if _n == 12
replace row = "Total healthcare costs (\textsterling)" if _n == 13
replace row = "Total indirect costs (\textsterling)" if _n == 14
replace row = "Total costs (\textsterling)" if _n == 15
replace row = "ICER (\textsterling \ per QALY)" if _n == 16
replace row = "SICER (\textsterling \ per QALY)" if _n == 17
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
save tempsumtab2sp_`c', replace
export delimited using CSV/BCrestabspsum_`c'.csv, delimiter(":") novarnames replace
}
clear
append using tempsumtab2_1 tempsumtab2_2
drop if inrange(_n,20,27)
gen C = "Overall" if _n == 1
replace C = "Australia" if _n == 9
replace C = "UK" if _n == 20
order C
export delimited using CSV/BCrestabsumpaper2_PP.csv, delimiter(":") novarnames replace
clear
append using tempsumtab2sp_1 tempsumtab2sp_2
drop if inrange(_n,18,23)
gen C = "Overall" if _n == 1
replace C = "Australia" if _n == 7
replace C = "UK" if _n == 18
order C
export delimited using CSV/BCrestabsumpaper2_SP.csv, delimiter(":") novarnames replace
}
texdoc stlog close

/***
\color{black}

The intervention is only slightly effective for preventing MI,
and far less so for stroke (Figure~\ref{cumincf2}). This is not surprising given how
few people actually receive therapy in response to Lp(a) testing (Table~\ref{BCDtab2ppa}). 

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population. Study 2. Australia.}
    \label{BCDtab2ppa}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Primary prevention population. Study 2. Australia.}
    \label{BCDtab2ppfa}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestab2_1.csv}
  \end{center}
\end{table}



\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Australia.}
    \label{BCDtab2spa}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Secondary prevention population. Study 2. Australia.}
    \label{BCDtab2spfa}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsp_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population. Study 2. UK.}
    \label{BCDtab2ppu}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Primary prevention population. Study 2. UK.}
    \label{BCDtab2ppfu}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestab2_2.csv}
  \end{center}
\end{table}



\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. UK.}
    \label{BCDtab2spu}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Secondary prevention population. Study 2. UK.}
    \label{BCDtab2spfu}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsp_2.csv}
  \end{center}
\end{table}


\clearpage
\subsection{Results by age and sex}

\color{Blue4}
***/


texdoc stlog, cmdlog nodo
quietly {
forval c = 1/2 {
forval a = 1/5 {
forval ii = 0/1 {
use modend2_`ii', clear
gen dage = age if cycle == 0
bysort ind (age) : egen daage = min(dage)
if `a' == 1 {
keep if sex == 0
}
if `a' == 2 {
keep if sex == 1
}
if `a' == 3 {
keep if inrange(daage,40,49)
}
if `a' == 4 {
keep if inrange(daage,50,59)
}
if `a' == 5 {
keep if inrange(daage,60,69)
}
drop dage daage
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.

if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
}


sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.



if `c' == 1 {
gen double MIOHSHC = MIOHS*6222
gen double STOHSHC = STOHS*4388
gen double DMOHSHC = DMOHS*3588
gen double MISHSHC =MISHS*6222
gen double MIDHSHC = MIDHS*8870
gen double STDHSHC = STDHS*8870
gen double MSDHSHC =MSDHS*8870
gen double ACMIC = 14434 if MIE == 1 & DTE == .
replace ACMIC = 3363 if MIE == 1 & DTE == 1
gen double ACSTC = 15659 if STE == 1 & DTE ==.
replace ACSTC = 13154 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+200 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+200+143+212 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
replace DRUGSHC = DRUGSHC+4360 if LPT == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}
if `c' == 2 {
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}



gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.




if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}


gen N = 1 if cycle == 0
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`ii'
save tabres2_`ii'_`a'_`c', replace
}
use tabres2_0_`a'_`c', clear
merge 1:1 _n using tabres2_1_`a'_`c', nogen
drop if inrange(_n,9,24)
replace val0 = val0[9]+val0[10]+val0[11]+val0[12]+val0[13]+val0[14]+val0[15] if _n == 15
replace val0 = val0[16]+val0[17] if _n == 17
replace val1 = val1[9]+val1[10]+val1[11]+val1[12]+val1[13]+val1[14]+val1[15] if _n == 15
replace val1 = val1[16]+val1[17] if _n == 17
drop if inrange(_n,9,14) | _n == 16
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 18
replace stat = "SICER" if _n == 19
replace val0 = . if _n>17
replace val1 = . if _n>17
replace diff = diff[15]/diff[14] if _n==18
replace diff = diff[17]/diff[14] if _n==19
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Incident MI (N)" if _n == 4
replace row = "Total MIs (N)" if _n == 5
replace row = "Incident stroke (N)" if _n == 6
replace row = "Total strokes (N)" if _n == 7
replace row = "Deaths (N)" if _n == 8
replace row = "Chronic healthcare costs (\textsterling)" if _n == 9
replace row = "Acute event costs (\textsterling)" if _n == 10
replace row = "Medication costs (\textsterling)" if _n == 11
replace row = "Lp(a) test costs (\textsterling)" if _n == 12
replace row = "Total YLL" if _n == 13
replace row = "Total QALY" if _n == 14
replace row = "Total healthcare costs (\textsterling)" if _n == 15
replace row = "Total indirect costs (\textsterling)" if _n == 16
replace row = "Total costs (\textsterling)" if _n == 17
replace row = "ICER (\textsterling \ per QALY)" if _n == 18
replace row = "SICER (\textsterling \ per QALY)" if _n == 19
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
export delimited using CSV/BCrestabsum2_`a'_`c'.csv, delimiter(":") novarnames replace
}
forval a = 1/5 {
forval i = 0/1 {
use modendsp`i', clear
gen dage = age if cycle == 0
bysort ind (age) : egen daage = min(dage)
if `a' == 1 {
keep if sex == 0
}
if `a' == 2 {
keep if sex == 1
}
if `a' == 3 {
keep if inrange(daage,40,49)
}
if `a' == 4 {
keep if inrange(daage,50,59)
}
if `a' == 5 {
keep if inrange(daage,60,69)
}
drop dage daage
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.


if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
}

sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.


if `c' == 1 {
gen double MIOHSHC = MIOHS*6222
gen double STOHSHC = STOHS*4388
gen double DMOHSHC = DMOHS*3588
gen double MISHSHC =MISHS*6222
gen double MIDHSHC = MIDHS*8870
gen double STDHSHC = STDHS*8870
gen double MSDHSHC =MSDHS*8870
gen double ACMIC = 14434 if MIE == 1 & DTE == .
replace ACMIC = 3363 if MIE == 1 & DTE == 1
gen double ACSTC = 15659 if STE == 1 & DTE ==.
replace ACSTC = 13154 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+4360 if LPT == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}


if `c' == 2 {
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}




gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.



if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}



gen N = 1 if cycle == 0
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 38
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save tabressp_`i'_`a'_`c', replace
}
use tabressp_0_`a'_`c', clear
merge 1:1 _n using tabressp_1_`a'_`c', nogen
drop if inrange(_n,7,22)
replace val0 = val0[7]+val0[8]+val0[9]+val0[10]+val0[11]+val0[12]+val0[13] if _n == 13
replace val0 = val0[14]+val0[15] if _n == 15
replace val1 = val1[7]+val1[8]+val1[9]+val1[10]+val1[11]+val1[12]+val1[13] if _n == 13
replace val1 = val1[14]+val1[15] if _n == 15
drop if inrange(_n,7,12) | _n == 14
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 17
replace stat = "SICER" if _n == 18
replace val0 = . if _n>15
replace val1 = . if _n>15
replace diff = diff[13]/diff[12] if _n==16
replace diff = diff[15]/diff[12] if _n==17
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Total MIs (N)" if _n == 4
replace row = "Total strokes (N)" if _n == 5
replace row = "Deaths (N)" if _n == 6
replace row = "Chronic healthcare costs (\textsterling)" if _n == 7
replace row = "Acute event costs (\textsterling)" if _n == 8
replace row = "Medication costs (\textsterling)" if _n == 9
replace row = "Lp(a) test costs (\textsterling)" if _n == 10
replace row = "Total YLL" if _n == 11
replace row = "Total QALY" if _n == 12
replace row = "Total healthcare costs (\textsterling)" if _n == 13
replace row = "Total indirect costs (\textsterling)" if _n == 14
replace row = "Total costs (\textsterling)" if _n == 15
replace row = "ICER (\textsterling \ per QALY)" if _n == 16
replace row = "SICER (\textsterling \ per QALY)" if _n == 17
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
export delimited using CSV/BCrestabspsum_`a'_`c'.csv, delimiter(":") novarnames replace
}
}
}
texdoc stlog close

/***
\color{black}

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, females. Study 2. Australia.}
    \label{ABCDtab2ppa1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_1_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, males. Study 2. Australia.}
    \label{ABCDtab2ppa2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_2_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 40-49 at baseline. Study 2. Australia.}
    \label{ABCDtab2ppa3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_3_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 50-59 at baseline. Study 2. Australia.}
    \label{ABCDtab2ppa4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_4_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 60-69 at baseline. Study 2. Australia.}
    \label{ABCDtab2ppa5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_5_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, females. Study 2. Australia.}
    \label{ABCDtab2spa1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_1_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, males. Study 2. Australia.}
    \label{ABCDtab2spa2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_2_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 40-49 at baseline. Study 2. Australia.}
    \label{ABCDtab2spa3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_3_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 50-59 at baseline. Study 2. Australia.}
    \label{ABCDtab2spa4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_4_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 60-69 at baseline. Study 2. Australia.}
    \label{ABCDtab2spa5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_5_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, females. Study 2. UK.}
    \label{UBCDtab2ppa1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_1_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, males. Study 2. UK.}
    \label{UBCDtab2ppa2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_2_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 40-49 at baseline. Study 2. UK.}
    \label{UBCDtab2ppa3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_3_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 50-59 at baseline. Study 2. UK.}
    \label{UBCDtab2ppa4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_4_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 60-69 at baseline. Study 2. UK.}
    \label{UBCDtab2ppa5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_5_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, females. Study 2. UK.}
    \label{UBCDtab2spa1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_1_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, males. Study 2. UK.}
    \label{UBCDtab2spa2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_2_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 40-49 at baseline. Study 2. UK.}
    \label{UBCDtab2spa3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_3_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 50-59 at baseline. Study 2. UK.}
    \label{UBCDtab2spa4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_4_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 60-69 at baseline. Study 2. UK.}
    \label{UBCDtab2spa5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_5_2.csv}
  \end{center}
\end{table}

\clearpage
\subsection{Threshold analyses}

Given that Olpasiran is not cost-effective at the estimated price, 
it is worth preforming a threshold analysis to work out the price
at which it would be cost-effective in both the primary and secondary prevention
populations. 


\color{Blue4}
***/

texdoc stlog, cmdlog nodo
*mkdir thresh
quietly {
forval c = 1/2 {
forval t = 50(50)4000 {
forval ii = 0/1 {
use threshtemp_`ii'_`c', clear

if `c' == 1 {
replace DRUGSHC = DRUGSHC-4360 if LPT == 1
}
if `c' == 2 {
replace DRUGSHC = DRUGSHC-3975 if LPT == 1
}
replace DRUGSHC = DRUGSHC+`t' if LPT == 1
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
keep QLY HCC TSC
expand 3
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist QLY-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`ii'
save thresh/tabres2_`ii'_c`t'_`c', replace
}
use thresh/tabres2_0_c`t'_`c', clear
merge 1:1 _n using thresh/tabres2_1_c`t'_`c', nogen
gen double diff = val1-val0
gen ICER = diff[2]/diff[1]
gen SICER = diff[3]/diff[1]
keep ICER SICER
gen DC = `t'
gen pop = 1
gen country = `c'
keep if _n == 1
save thresh/PP_`t'_`c', replace
forval ii = 0/1 {
use threshtempsp_`ii'_`c', clear
if `c' == 1 {
replace DRUGSHC = DRUGSHC-4360 if LPT == 1
}
if `c' == 2 {
replace DRUGSHC = DRUGSHC-3975 if LPT == 1
}
replace DRUGSHC = DRUGSHC+`t' if LPT == 1
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
keep QLY HCC TSC
expand 3
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist QLY-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`ii'
save thresh/tabres2sp_`ii'_c`t'_`c', replace
}
use thresh/tabres2sp_0_c`t'_`c', clear
merge 1:1 _n using thresh/tabres2sp_1_c`t'_`c', nogen
gen double diff = val1-val0
gen ICER = diff[2]/diff[1]
gen SICER = diff[3]/diff[1]
keep ICER SICER
gen DC = `t'
gen pop = 2
gen country = `c'
keep if _n == 1
save thresh/SP_`t'_`c', replace
}
}
}
forval c = 1/2 {
if `c' == 1 {
local cc = "Australia"
local cur = "AUD"
local y = 28000
}
if `c' == 2 {
local cc = "UK"
local cur = "GBP"
local y = "20000 30000"
}
clear
forval t = 50(50)4000 {
append using thresh/PP_`t'_`c'
}
drop if DC > 1000
twoway ///
(line ICER DC, color(magenta)) ///
(line SICER DC, color(dknavy)) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(1 "Healthcare perspective" ///
2 "Societal perspective") ///
cols(1)) yscale(nolog) xscale(nolog) ///
graphregion(color(white)) ///
ylabel(0(25000)200000, format(%9.0fc) angle(0)) ///
xlabel(0(100)1000, nogrid format(%9.0fc)) yline(`y', lcol(black%30)) ///
ytitle("ICER") title("`cc', primary prevention population", size(medium) placement(west) col(black)) ///
xtitle("Annual cost of Olpasiran (`cur')")
graph save "Graph" GPH/treshPP_`c', replace
clear
forval t = 50(50)4000 {
append using thresh/SP_`t'_`c'
}
twoway ///
(line ICER DC, color(magenta)) ///
(line SICER DC, color(dknavy)) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(1 "Healthcare perspective" ///
2 "Societal perspective") ///
cols(1)) yscale(nolog) xscale(nolog) ///
graphregion(color(white)) ///
ylabel(-20000(10000)50000, format(%9.0fc) angle(0)) ///
xlabel(0(500)4000, nogrid format(%9.0fc)) yline(0, lcol(black) lpattern(dash)) yline(`y', lcol(black%30)) ///
ytitle("ICER") title("`cc'", size(medium) placement(west) col(black)) ///
xtitle("Annual cost of Olpasiran (`cur')")
graph save "Graph" GPH/treshSP_`c', replace
}
texdoc stlog close
texdoc stlog, cmdlog
graph combine ///
GPH/treshPP_1.gph ///
GPH/treshPP_2.gph ///
GPH/treshSP_1.gph ///
GPH/treshSP_2.gph ///
, graphregion(color(white)) altshrink cols(2) xsize(5)
texdoc graph, label(thresh1) figure(h!) cabove fontface("Liberation Sans") ///
caption(Threshold analysis results. Grey lines show the willingness-to-pay thresholds for each country.)
texdoc stlog close

/***
\color{black}

\clearpage
\section{Scenario analyses}

\subsection{Study 1}

We will conduct the following scenario analyses for study 1:
\begin{enumerate}
\item Vary the Lp(a) threshold that leads to treatment from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL).
\item Vary the Lp(a) threshold that leads to treatment from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL) .
\item Vary the Lp(a) threshold that leads to treatment from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL).
\item Assuming LDL-C lowering via statins causally increases the risk of diabetes.
\item Vary the LDL-C threshold to initiate treatment from 5.0 mmol/L to 3.0 mmol/L.
\item Vary the SBP threshold to initiate treatment from 160 mmHg to 140 mmHg. 
\item Using a moderate intensity statin, rather than a high intensity statin. 
In Australia, the most common moderate intensity statin was Rosuvastatin
10 mg once per day (see below), which leads to an LDL-C reduction of 45.6\% \cite{Rosuvacochrane} and costs \$194 per year
(see below) in Australia \cite{PBSDOS23} and \textsterling 13.44 per year in the UK \cite{NHSDrugTariff062023}. 
\item 0\% discounting.
\item Changing the cost of the blood-pressure lowering therapy to that of a triple combination pill.
In Australia, this lowers the annual cost from \$555 to \$340 (see below). 
Given the already low medication costs in the UK, this scenario analysis was not performed for the UK.
\end{enumerate}

Note that scenario 4 is not applicable in the secondary prevention population --
all individuals with a prior event should have been on statin therapy during
the estimation of transition probabilities for this population, meaning the effects
of statins are already factored in. 

\color{Blue4}
***/
**# Bookmark #3

texdoc stlog, cmdlog nodo
quietly {
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"NYSTATIN")
drop if pos !=0
drop pos
gen pos = strpos(drug_name,"STATIN")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
collapse (sum) prescriptions, by(drug)
sort prescriptions
keep if _n == _N
noisily list drug
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "ROSUVASTATIN Tablet 10 mg (as calcium)"
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Triple combination " 365.25*r(mean)/30
}
quietly {
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"VALSARTAN")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "AMLODIPINE + VALSARTAN + HYDROCHLOROTHIAZIDE Tablet 10 mg (as besilate)-320 mg-25 mg"
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Triple combination " 365.25*r(mean)/30
}
texdoc stlog close
texdoc stlog
quietly {
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"NYSTATIN")
drop if pos !=0
drop pos
gen pos = strpos(drug_name,"STATIN")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
collapse (sum) prescriptions, by(drug)
sort prescriptions
keep if _n == _N
noisily list drug
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "ROSUVASTATIN Tablet 10 mg (as calcium)"
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Rosuvastatin 10 mg " 365.25*r(mean)/30
}
quietly {
import delimited "pbs-item-drug-map.csv", varnames(1) clear
gen pos = strpos(drug_name,"VALSARTAN")
keep if pos !=0
save PBSpos, replace
import delimited "dos-jul-2019-to-sep-2023.csv", clear
merge m:1 item_code using PBSpos
keep if _merge == 3
drop _merge
keep if month == 202306
gen drug = drug_name + " " + formstrength
keep if drug == "AMLODIPINE + VALSARTAN + HYDROCHLOROTHIAZIDE Tablet 10 mg (as besilate)-320 mg-25 mg"
gen unitcost = total_cost/prescriptions
su unitcost [aweight=prescriptions]
noisily di "Rosuvastatin 10 mg " 365.25*r(mean)/30
}
texdoc stlog close
texdoc stlog, cmdlog nodo
quietly {
forval s = 1/9 {
if `s' == 1 {
local lpa = 50
}
else if `s' == 2 {
local lpa = 70
}
else if `s' == 3 {
local lpa = 110
}
else {
local lpa = 90
}
if `s' <= 7 {
forval m = 0/1 {
use modstart, clear
forval c = 0/44 {
if `c' == 0 | `c' == 5 | `c' == 10 | `c' == 15 | `c' == 20 ///
| `c' == 25 |  `c' == 30 | `c' == 35 | `c' == 40 {
gen tyr = 100*(1-0.9776^(exp( ///
(0.4648*((age-60)/5)) + ///
(0.7744*cs) + ///
(0.3131*((sbp-120)/20)) + ///
(0.1002*(ldl+hdl+0.5-6)) + ///
(-0.2606*((hdl-1.3)/0.5)) + ///
(-0.1088*(cs*(age-60)/5)) + ///
(-0.0277*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0226*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0613*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 0
replace tyr = 100*(1-0.9605^(exp( ///
(0.3742*((age-60)/5)) + ///
(0.6012*cs) + ///
(0.2777*((sbp-120)/20)) + ///
(0.1458*(ldl+hdl+0.5-6)) + ///
(-0.2698*((hdl-1.3)/0.5)) + ///
(-0.0755*(cs*(age-60)/5)) + ///
(-0.0255*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0281*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0426*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 1
if `m' == 0 {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
if `s' == 5 {
replace LLT = 1 if cycle == `c' & ldl >= 3 & DT!=1 & MI == 0 & ST == 0
}
else {
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
}
if `s' == 6 {
replace AHT = 1 if cycle == `c' & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
}
else {
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
}
if `s' == 7 {
bysort ind (age) : replace ldl = ldl*(1-0.456) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
}
else {
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
}
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
if `c' == 0 {
gen LPAT=.
}
}
if `m' == 1 {
if `c' == 0 {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70)
gen LPAT=1 if vhr!=1 & cycle == `c'
replace vhr = 1 if lpa >= `lpa' & cycle == `c'
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70 | lpa >= `lpa') & MI == 0 & ST == 0
}
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
if `s' == 5 {
replace LLT = 1 if cycle == `c' & ldl >= 3 & DT!=1 & MI == 0 & ST == 0
}
else {
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
}
if `s' == 6 {
replace AHT = 1 if cycle == `c' & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
}
else {
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
}
if `s' == 7 {
bysort ind (age) : replace ldl = ldl*(1-0.456) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
}
else {
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
}
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
if `s' == 5 {
replace LLT = 1 if cycle == `c' & ldl >= 3 & DT!=1 & MI == 0 & ST == 0
}
else {
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
}
if `s' == 6 {
replace AHT = 1 if cycle == `c' & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
}
else {
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
}
if `s' == 7 {
bysort ind (age) : replace ldl = ldl*(1-0.456) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
}
else {
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
}
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
gen cumldl=.
gen mcldl=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen ldllog_`ii' = ldl*logf_`ii'
bysort ind (age) : gen cumldllog_`ii' = sum(ldllog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumldl = cumldllog_`ii' if age == `ii'
replace mcldl = cumldllog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumldl
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
gen cumsbp=.
gen mcsbp=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-2.1)/2.1)^(-2) if age <= `ii'
gen sbplog_`ii' = sbp*logf_`ii'
bysort ind (age) : gen cumsbplog_`ii' = sum(sbplog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumsbp = cumsbplog_`ii' if age == `ii'
replace mcsbp = cumsbplog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumsbp
replace mcldl = . if cycle!=`c'
replace mclpa = . if cycle!=`c'
replace mcsbp = . if cycle!=`c'
merge m:1 sex age using aveldl_cal, keep(1 3) nogen
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
merge m:1 sex age using avesbp_cal, keep(1 3) nogen
merge m:1 sex age using DMmod, keep(1 3) nogen
merge m:1 sex age using LSImod, keep(1 3) nogen
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
merge m:1 age sex using INC/`i'
drop _merge errr
rename (rate) (rate_`i')
}
replace rate_t2d = 0 if DM == 1
recast double rate_t2d-rate_nfICH
if `s' == 4 {
replace rate_t2d = rate_t2d*(0.763^(mcldl-aveldl))
}
replace rate_t2d = rate_t2d*(1.21^(lsi-LSI))
foreach i in nf f {
replace rate_`i'MI=rate_`i'MI*(2.083^(mcldl-aveldl))
replace rate_`i'MI=rate_`i'MI*(1.0054^(mclpa-avelpa))
replace rate_`i'MI=rate_`i'MI*(1.058^(mcsbp-avesbp))
replace rate_`i'MI=rate_`i'MI*(1.43^(lsi-LSI))
replace rate_`i'MI=rate_`i'MI/(1+(0.26*DMP)) if DM == 0
replace rate_`i'MI=1.26*rate_`i'MI/(1+(0.26*DMP)) if DM == 1
replace rate_`i'IS=rate_`i'IS*(1.08^(mcldl-aveldl))
replace rate_`i'IS=rate_`i'IS*(1.0035^(mclpa-avelpa))
replace rate_`i'IS=rate_`i'IS*(1.027^(mcsbp-avesbp))
replace rate_`i'IS=rate_`i'IS*(1.33^(lsi-LSI))
replace rate_`i'IS=rate_`i'IS/(1+(0.74*DMP)) if DM == 0
replace rate_`i'IS=1.74*rate_`i'IS/(1+(0.74*DMP)) if DM == 1
replace rate_`i'ICH=rate_`i'ICH*(1.039^(mcsbp-avesbp))
}
replace rate_blacdeath = rate_blacdeath*(2.52^(lsi-LSI))
replace rate_colcdeath = rate_colcdeath*(1.24^(lsi-LSI))
replace rate_oescdeath = rate_oescdeath*(3.67^(lsi-LSI))
replace rate_kidcdeath = rate_kidcdeath*(1.69^(lsi-LSI))
replace rate_luncdeath = rate_luncdeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_luncdeath = rate_luncdeath*(37.6) if lsi-LSI > 0.694*2
replace rate_ovacdeath = rate_ovacdeath*(1.27^(lsi-LSI))
replace rate_pancdeath = rate_pancdeath*(2.13^(lsi-LSI))
replace rate_pneudeath = rate_pneudeath*(1.016^(mcsbp-avesbp))
replace rate_pneudeath = rate_pneudeath*(4.03^(lsi-LSI))
replace rate_copddeath = rate_copddeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_copddeath = rate_copddeath*(37.6) if lsi-LSI > 0.694*2
replace rate_alsdeath = rate_alsdeath*(1.09^(mcldl-aveldl))
replace rate_pddeath = rate_pddeath*(0.48^(lsi-LSI))
recode rate_ovacdeath .=0
merge m:1 sex MI ST age using pevtp, keep(1 3) nogen
sort ind age
gen ratesum0 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace ratesum0 = ratesum0+`var' if MI == 0 & ST == 0
}
gen tpsum0 = 1-exp(-ratesum0)
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = tpsum0*`var'/ratesum0 if MI == 0 & ST == 0
}
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = `var'+`var1' if MI == 0 & ST == 0
local var1 = "`var'"
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,rate_fMI) | inrange(rand,rate_nfMI,rate_fIS) | inrange(rand,rate_nfIS,rate_fICH)) & MI==0 & ST == 0 & cycle == `c'
replace MIE=1 if inrange(rand,rate_otherdeath,rate_nfMI) & MI== 0 & ST == 0 & cycle == `c'
replace STE=1 if inrange(rand,rate_nfMI,rate_nfICH) & MI== 0 & ST == 0 & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace ldl = ldl[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace sbp = sbp[_n-1]+0.91 if cycle[_n-1]==`c' & sex == 0
bysort ind (age) : replace sbp = sbp[_n-1]+0.56 if cycle[_n-1]==`c' & sex == 1
bysort ind (age) : replace LLT = LLT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace AHT = AHT[_n-1] if cycle[_n-1]==`c'
foreach var of varlist hdl-lsi LLT AHT {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT
}
save modend`m'_`s', replace
}
}
forval c = 1/2 {
forval i = 0/1 {
if `s' <= 7 {
use modend`i'_`s', clear
}
else {
use modend`i', clear
}
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
sort ind age
gen LPATT=1 if LPAT==1 & lpa >= `lpa'
keep if cycle!=.


if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
}

sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.
if `c' == 1 {
gen double MIOHSHC = MIOHS*6222
gen double STOHSHC = STOHS*4388
gen double DMOHSHC = DMOHS*3588
gen double MISHSHC =MISHS*6222
gen double MIDHSHC = MIDHS*8870
gen double STDHSHC = STDHS*8870
gen double MSDHSHC =MSDHS*8870
gen double ACMIC = 14434 if MIE == 1 & DTE == .
replace ACMIC = 3363 if MIE == 1 & DTE == 1
gen double ACSTC = 15659 if STE == 1 & DTE ==.
replace ACSTC = 13154 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
if `s' == 7 {
replace DRUGSHC = DRUGSHC+194 if LLT == 1 & MI == 0 & ST == 0
}
else {
replace DRUGSHC = DRUGSHC+200 if LLT == 1 & MI == 0 & ST == 0
}
if `s' == 9 {
replace DRUGSHC = DRUGSHC+340 if AHT == 1 & MI == 0 & ST == 0
}
else {
replace DRUGSHC = DRUGSHC+200+143+212 if AHT == 1 & MI == 0 & ST == 0
}
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}
if `c' == 2 {
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
if `s' == 7 {
replace DRUGSHC = DRUGSHC+13.44 if LLT == 1 & MI == 0 & ST == 0
}
else {
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
}
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}
gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
if `s' == 8 {
gen DC = 1
}
else {
gen DC = 1/((1.05)^(cycle))
}
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
if `s' == 8 {
gen DC = 1
}
else {
gen DC = 1/((1.035)^(cycle))
}
}
gen N = 1 if cycle == 0
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save tabres_`i'_`s'_`c', replace
}
use tabres_0_`s'_`c', clear
merge 1:1 _n using tabres_1_`s'_`c', nogen
drop if inrange(_n,9,24)
replace val0 = val0[9]+val0[10]+val0[11]+val0[12]+val0[13]+val0[14]+val0[15] if _n == 15
replace val0 = val0[16]+val0[17] if _n == 17
replace val1 = val1[9]+val1[10]+val1[11]+val1[12]+val1[13]+val1[14]+val1[15] if _n == 15
replace val1 = val1[16]+val1[17] if _n == 17
drop if inrange(_n,9,14) | _n == 16
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 18
replace stat = "SICER" if _n == 19
replace val0 = . if _n>17
replace val1 = . if _n>17
replace diff = diff[15]/diff[14] if _n==18
replace diff = diff[17]/diff[14] if _n==19
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Incident MI (N)" if _n == 4
replace row = "Total MIs (N)" if _n == 5
replace row = "Incident stroke (N)" if _n == 6
replace row = "Total strokes (N)" if _n == 7
replace row = "Deaths (N)" if _n == 8
replace row = "Chronic healthcare costs (\textsterling)" if _n == 9
replace row = "Acute event costs (\textsterling)" if _n == 10
replace row = "Medication costs (\textsterling)" if _n == 11
replace row = "Lp(a) test costs (\textsterling)" if _n == 12
replace row = "Total YLL" if _n == 13
replace row = "Total QALY" if _n == 14
replace row = "Total healthcare costs (\textsterling)" if _n == 15
replace row = "Total indirect costs (\textsterling)" if _n == 16
replace row = "Total costs (\textsterling)" if _n == 17
replace row = "ICER (\textsterling \ per QALY)" if _n == 18
replace row = "SICER (\textsterling \ per QALY)" if _n == 19
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
export delimited using CSV/SCErestabsum_`s'_`c'.csv, delimiter(":") novarnames replace
}
}
}
texdoc stlog close

/***
\color{black}

\clearpage
\subsubsection{Results}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 1: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). Australia.}
    \label{BCDtabsce1a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_1_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 2: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). Australia.}
    \label{BCDtabsce2a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_2_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 3: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). Australia.}
    \label{BCDtabsce3a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_3_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 4: LDL-C lowering with statins causes diabetes. Australia.}
    \label{BCDtabsce4a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_4_1.csv}
  \end{center}
\end{table}



\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 5: LDL-C lowering occurs at 3.0 mmol/L, not 5.0 mmol/L. Australia.}
    \label{BCDtabsce5a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_5_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 6: SBP lowering occurs at 140 mmHg, not 160 mmHg. Australia.}
    \label{BCDtabsce6a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_6_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 7: Moderate intensity statin. Australia.}
    \label{BCDtabsce7a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_7_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 8: 0\% discounting. Australia.}
    \label{BCDtabsce8a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_8_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 9: Combination price for anti-hypertensive therapy. Australia.}
    \label{BCDtabsce9a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_9_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 1: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). UK.}
    \label{BCDtabsce1u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_1_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 2: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). UK.}
    \label{BCDtabsce2u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_2_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 3: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). UK.}
    \label{BCDtabsce3u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_3_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 4: LDL-C lowering with statins causes diabetes. UK.}
    \label{BCDtabsce4u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_4_2.csv}
  \end{center}
\end{table}



\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 5: LDL-C lowering occurs at 3.0 mmol/L, not 5.0 mmol/L. UK.}
    \label{BCDtabsce5u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_5_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 6: SBP lowering occurs at 140 mmHg, not 160 mmHg. UK.}
    \label{BCDtabsce6u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_6_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 7: Moderate intensity statin. UK.}
    \label{BCDtabsce7u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_7_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 8: 0\% discounting. UK.}
    \label{BCDtabsce8u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_8_2.csv}
  \end{center}
\end{table}


\clearpage
\subsection{Study 2}

We will conduct the following scenario analyses for study 2:
\begin{enumerate}
\item Vary the Lp(a) threshold that leads to treatment from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL).
\item Vary the Lp(a) threshold that leads to treatment from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL).
\item Vary the Lp(a) threshold that leads to treatment from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL).
\item 0\% discounting.
\end{enumerate}

For all of these, we will present both the primary results and results of the threshold analysis. 

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
quietly {
forval s = 1/4 {
if `s' == 1 {
local lpa = 50
}
else if `s' == 2 {
local lpa = 70
}
else if `s' == 3 {
local lpa = 110
}
else {
local lpa = 90
}

if `s' <= 3 {
forval m = 0/1 {
use modstart2, clear
gen LPAT=.
gen LPT=.
forval c = 0/44 {
if `c' == 0 | `c' == 5 | `c' == 10 | `c' == 15 | `c' == 20 ///
| `c' == 25 |  `c' == 30 | `c' == 35 | `c' == 40 {
gen tyr = 100*(1-0.9776^(exp( ///
(0.4648*((age-60)/5)) + ///
(0.7744*cs) + ///
(0.3131*((sbp-120)/20)) + ///
(0.1002*(ldl+hdl+0.5-6)) + ///
(-0.2606*((hdl-1.3)/0.5)) + ///
(-0.1088*(cs*(age-60)/5)) + ///
(-0.0277*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0226*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0613*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 0
replace tyr = 100*(1-0.9605^(exp( ///
(0.3742*((age-60)/5)) + ///
(0.6012*cs) + ///
(0.2777*((sbp-120)/20)) + ///
(0.1458*(ldl+hdl+0.5-6)) + ///
(-0.2698*((hdl-1.3)/0.5)) + ///
(-0.0755*(cs*(age-60)/5)) + ///
(-0.0255*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0281*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0426*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 1
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-0.517) if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-20 if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
replace vhr = 1 if MI == 1 | ST == 1
if `m' == 1 {
replace LPAT=1 if vhr==1 & cycle == `c'
replace LPT=1 if lpa >= `lpa' & LPAT==1 & cycle == `c' & vhr == 1
bysort ind (age) : replace lpa = lpa*(1-0.975) if cycle == `c' & LPT == 1 & LPT[_n-1]!=1
}
gen cumldl=.
gen mcldl=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen ldllog_`ii' = ldl*logf_`ii'
bysort ind (age) : gen cumldllog_`ii' = sum(ldllog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumldl = cumldllog_`ii' if age == `ii'
replace mcldl = cumldllog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumldl
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
gen cumsbp=.
gen mcsbp=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-2.1)/2.1)^(-2) if age <= `ii'
gen sbplog_`ii' = sbp*logf_`ii'
bysort ind (age) : gen cumsbplog_`ii' = sum(sbplog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumsbp = cumsbplog_`ii' if age == `ii'
replace mcsbp = cumsbplog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumsbp
replace mcldl = . if cycle!=`c'
replace mclpa = . if cycle!=`c'
replace mcsbp = . if cycle!=`c'
merge m:1 sex age using aveldl_cal, keep(1 3) nogen
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
merge m:1 sex age using avesbp_cal, keep(1 3) nogen
merge m:1 sex age using DMmod, keep(1 3) nogen
merge m:1 sex age using LSImod, keep(1 3) nogen
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
merge m:1 age sex using INC/`i'
drop _merge errr
rename (rate) (rate_`i')
}
replace rate_t2d = 0 if DM == 1
recast double rate_t2d-rate_nfICH
merge m:1 sex MI ST age using pevtp, keep(1 3) nogen
sort ind age
replace rate_t2d = rate_t2d*(1.21^(lsi-LSI))
foreach i in nf f {
replace rate_`i'MI=rate_`i'MI*(2.083^(mcldl-aveldl))
replace rate_`i'MI=rate_`i'MI*(1.0054^(mclpa-avelpa))
replace rate_`i'MI=rate_`i'MI*(1.058^(mcsbp-avesbp))
replace rate_`i'MI=rate_`i'MI*(1.43^(lsi-LSI))
replace rate_`i'MI=rate_`i'MI/(1+(0.26*DMP)) if DM == 0
replace rate_`i'MI=1.26*rate_`i'MI/(1+(0.26*DMP)) if DM == 1
replace rate_`i'IS=rate_`i'IS*(1.08^(mcldl-aveldl))
replace rate_`i'IS=rate_`i'IS*(1.0035^(mclpa-avelpa))
replace rate_`i'IS=rate_`i'IS*(1.027^(mcsbp-avesbp))
replace rate_`i'IS=rate_`i'IS*(1.33^(lsi-LSI))
replace rate_`i'IS=rate_`i'IS/(1+(0.74*DMP)) if DM == 0
replace rate_`i'IS=1.74*rate_`i'IS/(1+(0.74*DMP)) if DM == 1
replace rate_`i'ICH=rate_`i'ICH*(1.039^(mcsbp-avesbp))
replace rate`i'MI=rate`i'MI*(1.0054^(mclpa-avelpa))
replace rate`i'S=rate`i'S*(1.0035^(mclpa-avelpa))
}
replace rate_blacdeath = rate_blacdeath*(2.52^(lsi-LSI))
replace rate_colcdeath = rate_colcdeath*(1.24^(lsi-LSI))
replace rate_oescdeath = rate_oescdeath*(3.67^(lsi-LSI))
replace rate_kidcdeath = rate_kidcdeath*(1.69^(lsi-LSI))
replace rate_luncdeath = rate_luncdeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_luncdeath = rate_luncdeath*(37.6) if lsi-LSI > 0.694*2
replace rate_ovacdeath = rate_ovacdeath*(1.27^(lsi-LSI))
replace rate_pancdeath = rate_pancdeath*(2.13^(lsi-LSI))
replace rate_pneudeath = rate_pneudeath*(1.016^(mcsbp-avesbp))
replace rate_pneudeath = rate_pneudeath*(4.03^(lsi-LSI))
replace rate_copddeath = rate_copddeath*(13.64^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_copddeath = rate_copddeath*(37.6) if lsi-LSI > 0.694*2
replace rate_alsdeath = rate_alsdeath*(1.09^(mcldl-aveldl))
replace rate_pddeath = rate_pddeath*(0.48^(lsi-LSI))
recode rate_ovacdeath .=0
gen ratesum0 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace ratesum0 = ratesum0+`var' if MI == 0 & ST == 0
}
gen tpsum0 = 1-exp(-ratesum0)
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = tpsum0*`var'/ratesum0 if MI == 0 & ST == 0
}
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = `var'+`var1' if MI == 0 & ST == 0
local var1 = "`var'"
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,rate_fMI) | inrange(rand,rate_nfMI,rate_fIS) | inrange(rand,rate_nfIS,rate_fICH)) & MI==0 & ST == 0 & cycle == `c'
replace MIE=1 if inrange(rand,rate_otherdeath,rate_nfMI) & MI== 0 & ST == 0 & cycle == `c'
replace STE=1 if inrange(rand,rate_nfMI,rate_nfICH) & MI== 0 & ST == 0 & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace ldl = ldl[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace sbp = sbp[_n-1]+0.91 if cycle[_n-1]==`c' & sex == 0
bysort ind (age) : replace sbp = sbp[_n-1]+0.56 if cycle[_n-1]==`c' & sex == 1
bysort ind (age) : replace LLT = LLT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace AHT = AHT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace LPT = LPT[_n-1] if cycle[_n-1]==`c'

foreach var of varlist hdl-lsi LLT AHT LPT {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT LPT
}
save modend2_`m'_`s', replace
}
forval m = 0/1 {
use modstartsp, clear
if `m' == 0 {
gen LPAT=.
gen LPT=.
}
if `m' == 1 {
gen LPAT=1 if cycle == 0
gen LPT=1 if lpa >= `lpa' & cycle == 0
}
forval c = 0/44 {
if `m' == 1 {
bysort ind (age) : replace lpa = lpa*(1-0.975) if cycle == `c' & LPT == 1 & LPT[_n-1]!=1
}
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
replace mclpa = . if cycle!=`c'
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
merge m:1 sex age using LSImod, keep(1 3) nogen
merge m:1 age sex using INC/t2d
drop _merge errr
rename (rate) (rate_t2d)
replace rate_t2d = 0 if DM == 1
recast double rate_t2d
merge m:1 sex MI ST age using pevtp, keep(1 3) nogen
replace rate_t2d = rate_t2d*(1.21^(lsi-LSI))
foreach i in nf f {
replace rate`i'MI=rate`i'MI*(1.0054^(mclpa-avelpa))
replace rate`i'S=rate`i'S*(1.0035^(mclpa-avelpa))
}
sort ind age
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
foreach var of varlist lpa lsi {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT LPT
}
save modendsp`m'_`s', replace
}
}

forval c = 1/2 {
forval ii = 0/1 {
if `s' <= 3 {
use modend2_`ii'_`s', clear
}
else {
use modend2_`ii', clear
}
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.

if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
}

sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.



if `c' == 1 {
gen double MIOHSHC = MIOHS*6222
gen double STOHSHC = STOHS*4388
gen double DMOHSHC = DMOHS*3588
gen double MISHSHC =MISHS*6222
gen double MIDHSHC = MIDHS*8870
gen double STDHSHC = STDHS*8870
gen double MSDHSHC =MSDHS*8870
gen double ACMIC = 14434 if MIE == 1 & DTE == .
replace ACMIC = 3363 if MIE == 1 & DTE == 1
gen double ACSTC = 15659 if STE == 1 & DTE ==.
replace ACSTC = 13154 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+200 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+200+143+212 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
replace DRUGSHC = DRUGSHC+4360 if LPT == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}
if `c' == 2 {
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}



gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
if `s' == 4 {
gen DC = 1
}
else {
gen DC = 1/((1.05)^(cycle))
}
}


if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
if `s' == 4 {
gen DC = 1
}
else {
gen DC = 1/((1.035)^(cycle))
}
}


gen N = 1 if cycle == 0
save threshtemp_`ii'_`s'_`c', replace
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`ii'
save tabres2_`ii'_`s'_`c', replace
}
use tabres2_0_`s'_`c', clear
merge 1:1 _n using tabres2_1_`s'_`c', nogen
drop if inrange(_n,9,24)
replace val0 = val0[9]+val0[10]+val0[11]+val0[12]+val0[13]+val0[14]+val0[15] if _n == 15
replace val0 = val0[16]+val0[17] if _n == 17
replace val1 = val1[9]+val1[10]+val1[11]+val1[12]+val1[13]+val1[14]+val1[15] if _n == 15
replace val1 = val1[16]+val1[17] if _n == 17
drop if inrange(_n,9,14) | _n == 16
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 18
replace stat = "SICER" if _n == 19
replace val0 = . if _n>17
replace val1 = . if _n>17
replace diff = diff[15]/diff[14] if _n==18
replace diff = diff[17]/diff[14] if _n==19
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Incident MI (N)" if _n == 4
replace row = "Total MIs (N)" if _n == 5
replace row = "Incident stroke (N)" if _n == 6
replace row = "Total strokes (N)" if _n == 7
replace row = "Deaths (N)" if _n == 8
replace row = "Chronic healthcare costs (\textsterling)" if _n == 9
replace row = "Acute event costs (\textsterling)" if _n == 10
replace row = "Medication costs (\textsterling)" if _n == 11
replace row = "Lp(a) test costs (\textsterling)" if _n == 12
replace row = "Total YLL" if _n == 13
replace row = "Total QALY" if _n == 14
replace row = "Total healthcare costs (\textsterling)" if _n == 15
replace row = "Total indirect costs (\textsterling)" if _n == 16
replace row = "Total costs (\textsterling)" if _n == 17
replace row = "ICER (\textsterling \ per QALY)" if _n == 18
replace row = "SICER (\textsterling \ per QALY)" if _n == 19
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
export delimited using CSV/SCErestabsum2_`s'_`c'.csv, delimiter(":") novarnames replace
forval i = 0/1 {
if `s' <= 3 {
use modendsp`i'_`s', clear
}
else {
use modendsp`i', clear
}
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.

if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
}
sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.




if `c' == 1 {
gen double MIOHSHC = MIOHS*6222
gen double STOHSHC = STOHS*4388
gen double DMOHSHC = DMOHS*3588
gen double MISHSHC =MISHS*6222
gen double MIDHSHC = MIDHS*8870
gen double STDHSHC = STDHS*8870
gen double MSDHSHC =MSDHS*8870
gen double ACMIC = 14434 if MIE == 1 & DTE == .
replace ACMIC = 3363 if MIE == 1 & DTE == 1
gen double ACSTC = 15659 if STE == 1 & DTE ==.
replace ACSTC = 13154 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+4360 if LPT == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}


if `c' == 2 {
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}




gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.

if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
if `s' == 4 {
gen DC = 1
}
else {
gen DC = 1/((1.05)^(cycle))
}
}

if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
if `s' == 4 {
gen DC = 1
}
else {
gen DC = 1/((1.035)^(cycle))
}
}
gen N = 1 if cycle == 0
save threshtempsp_`i'_`s'_`c', replace
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 38
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save tabressp_`i'_`s'_`c', replace
}
use tabressp_0_`s'_`c', clear
merge 1:1 _n using tabressp_1_`s'_`c', nogen
drop if inrange(_n,7,22)
replace val0 = val0[7]+val0[8]+val0[9]+val0[10]+val0[11]+val0[12]+val0[13] if _n == 13
replace val0 = val0[14]+val0[15] if _n == 15
replace val1 = val1[7]+val1[8]+val1[9]+val1[10]+val1[11]+val1[12]+val1[13] if _n == 13
replace val1 = val1[14]+val1[15] if _n == 15
drop if inrange(_n,7,12) | _n == 14
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 17
replace stat = "SICER" if _n == 18
replace val0 = . if _n>15
replace val1 = . if _n>15
replace diff = diff[13]/diff[12] if _n==16
replace diff = diff[15]/diff[12] if _n==17
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Total MIs (N)" if _n == 4
replace row = "Total strokes (N)" if _n == 5
replace row = "Deaths (N)" if _n == 6
replace row = "Chronic healthcare costs (\textsterling)" if _n == 7
replace row = "Acute event costs (\textsterling)" if _n == 8
replace row = "Medication costs (\textsterling)" if _n == 9
replace row = "Lp(a) test costs (\textsterling)" if _n == 10
replace row = "Total YLL" if _n == 11
replace row = "Total QALY" if _n == 12
replace row = "Total healthcare costs (\textsterling)" if _n == 13
replace row = "Total indirect costs (\textsterling)" if _n == 14
replace row = "Total costs (\textsterling)" if _n == 15
replace row = "ICER (\textsterling \ per QALY)" if _n == 16
replace row = "SICER (\textsterling \ per QALY)" if _n == 17
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
order row val0 val1 diff
drop stat
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
export delimited using CSV/SCErestabspsum_`s'_`c'.csv, delimiter(":") novarnames replace
forval t = 50(50)4000 {
forval ii = 0/1 {
use threshtemp_`ii'_`s'_`c', clear
if `c' == 1 {
replace DRUGSHC = DRUGSHC-4360 if LPT == 1
}
if `c' == 2 {
replace DRUGSHC = DRUGSHC-3975 if LPT == 1
}
replace DRUGSHC = DRUGSHC+`t' if LPT == 1
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
keep QLY HCC TSC
expand 3
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist QLY-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`ii'
save thresh/tabres2_`ii'_c`t'_`s'_`c', replace
}
use thresh/tabres2_0_c`t'_`s'_`c', clear
merge 1:1 _n using thresh/tabres2_1_c`t'_`s'_`c', nogen
gen double diff = val1-val0
gen ICER = diff[2]/diff[1]
gen SICER = diff[3]/diff[1]
keep ICER SICER
gen DC = `t'
gen pop = 1
keep if _n == 1
gen sce = `s'
save thresh/PP_`t'_`s'_`c', replace
forval ii = 0/1 {
use threshtempsp_`ii'_`s'_`c', clear
if `c' == 1 {
replace DRUGSHC = DRUGSHC-4360 if LPT == 1
}
if `c' == 2 {
replace DRUGSHC = DRUGSHC-3975 if LPT == 1
}
replace DRUGSHC = DRUGSHC+`t' if LPT == 1
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
keep QLY HCC TSC
expand 3
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist QLY-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`ii'
save thresh/tabres2sp_`ii'_c`t'_`s'_`c', replace
}
use thresh/tabres2sp_0_c`t'_`s'_`c', clear
merge 1:1 _n using thresh/tabres2sp_1_c`t'_`s'_`c', nogen
gen double diff = val1-val0
gen ICER = diff[2]/diff[1]
gen SICER = diff[3]/diff[1]
keep ICER SICER
gen DC = `t'
gen pop = 2
keep if _n == 1
gen sce = `s'
gen country = `c'
save thresh/SP_`t'_`s'_`c', replace
}
}
}
}
texdoc stlog close

/***
\color{black}

\clearpage
\subsubsection{Results}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 1:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). Australia.}
    \label{ABCDtab2ppsce1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_1_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Scenario 1:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). Australia.}
    \label{ABCDtab22psce1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_1_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 2:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). Australia.}
    \label{ABCDtab2ppsce2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_2_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Scenario 2:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). Australia.}
    \label{ABCDtab2spsce2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_2_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 3:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). Australia.}
    \label{ABCDtab2ppsce3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_3_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Scenario 3:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). Australia.}
    \label{ABCDtab2spsce3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_3_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 4:  LDL-C lowering with statins causes diabetes. Australia.}
    \label{ABCDtab2ppsce4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_4_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 5: 0\% discounting. Australia.}
    \label{ABCDtab2ppsce5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_5_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Scenario 5: 0\% discounting. Australia.}
    \label{ABCDtab2spsce5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_5_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 1:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). UK.}
    \label{UBCDtab2ppsce1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_1_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Scenario 1:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). UK.}
    \label{UBCDtab22psce1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_1_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 2:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). UK.}
    \label{UBCDtab2ppsce2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_2_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Scenario 2:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). UK.}
    \label{UBCDtab2spsce2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_2_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 3:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). UK.}
    \label{UBCDtab2ppsce3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_3_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Scenario 3:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). UK.}
    \label{UBCDtab2spsce3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_3_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 4:  LDL-C lowering with statins causes diabetes. UK.}
    \label{UBCDtab2ppsce4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_4_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Scenario 4:  LDL-C lowering with statins causes diabetes. UK.}
    \label{UBCDtab2spsce4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_4_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Study 2. Scenario 5: 0\% discounting. UK.}
    \label{UBCDtab2ppsce5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_5_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Study 2. Scenario 5: 0\% discounting. UK.}
    \label{UBCDtab2spsce5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_5_2.csv}
  \end{center}
\end{table}


\color{Blue4}
***/

texdoc stlog, cmdlog nodo
forval c = 1/2 {
if `c' == 1 {
local cc = "Australia"
local cur = "AUD"
local y = 28000
}
if `c' == 2 {
local cc = "UK"
local cur = "GBP"
local y = "20000 30000"
}
clear
forval s = 1/4 {
forval t = 50(50)4000 {
append using thresh/PP_`t'_`s'_`c'
}
}
drop if DC > 1000
colorpalette viridis, n(5) nograph
twoway ///
(line ICER DC if sce == 1, color("`r(p1)'")) ///
(line ICER DC if sce == 2, color("`r(p2)'")) ///
(line ICER DC if sce == 3, color("`r(p3)'")) ///
(line ICER DC if sce == 4, color("`r(p4)'")) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(1 "1" ///
2 "2" ///
3 "3" ///
4 "4") ///
cols(1) subtitle(Scenario)) yscale(nolog) xscale(nolog) ///
graphregion(color(white)) ///
ylabel(0(50000)200000, format(%9.0fc) angle(0)) ///
xlabel(0(100)1000, nogrid format(%9.0fc)) yline(`y', lcol(black%30)) ///
ytitle("ICER") title("`cc', primary prevention population", size(medium) placement(west) col(black)) ///
xtitle("Annual cost of Olpasiran (`cur')")
graph save "Graph" GPH/treshPP_`c'_sce, replace
clear
forval s = 1/4 {
forval t = 50(50)4000 {
append using thresh/SP_`t'_`s'_`c'
}
}
colorpalette viridis, n(5) nograph
twoway ///
(line ICER DC if sce == 1, color("`r(p1)'")) ///
(line ICER DC if sce == 2, color("`r(p2)'")) ///
(line ICER DC if sce == 3, color("`r(p3)'")) ///
(line ICER DC if sce == 4, color("`r(p4)'")) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(1 "1" ///
2 "2" ///
3 "3" ///
4 "4") ///
cols(1) subtitle(Scenario)) yscale(nolog) xscale(nolog) ///
graphregion(color(white)) ///
ylabel(0(5000)35000, format(%9.0fc) angle(0)) ///
xlabel(0(500)4000, nogrid format(%9.0fc)) yline(0, lcol(black) lpattern(dash)) yline(`y', lcol(black%30)) ///
ytitle("ICER") title("`cc', secondary prevention population", size(medium) placement(west) col(black)) ///
xtitle("Annual cost of Olpasiran (`cur')")
graph save "Graph" GPH/treshSP_`c'_sce, replace
}
texdoc stlog close
texdoc stlog, cmdlog
graph combine ///
GPH/treshPP_1_sce.gph ///
GPH/treshPP_2_sce.gph ///
GPH/treshSP_1_sce.gph ///
GPH/treshSP_2_sce.gph ///
, graphregion(color(white)) altshrink cols(2) xsize(5)
texdoc graph, label(threshsce) figure(h!) cabove fontface("Liberation Sans") ///
caption(Threshold analysis results for scenario analyses in Study 2. ICERs are from the healthcare perspective.)
texdoc stlog close

/***
\color{black}

\clearpage
\section{One-way sensitivity analyses}

\subsection{Study 1}

\subsubsection{Code}

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
*mkdir OSA
quietly {
foreach osa in 0 ///
101 102 103 104 105 106 107 108 ///
109 110 111 112 113 114 115 116 ///
117 118 119 120 121 122 123 124 ///
125 126 127 128 129 130 131 132 133 134 ///
201 202 203 204 205 ///
301 302 303 304 305 306 307 308 ///
309 310 311 312 313 314 315 316 ///
317 318 319 320 321 322 323 324 ///
401 402 ///
501 502 503 504 505 506 507 508 509 510 ///
601 602 603 604 605 606 607 608 609 /// 
701 702 703 704 705 706 {
noisily di `osa'
forval rf = 1/2 {
foreach o in 0 ///
101 102 103 104 105 106 107 108 ///
109 110 111 112 113 114 115 116 ///
117 118 119 120 121 122 123 124 ///
125 126 127 128 129 130 131 132 ///
133 134 ///
201 202 203 204 205 ///
301 302 303 304 305 306 307 308 ///
309 310 311 312 313 314 315 316 ///
317 318 319 320 321 322 323 324 ///
401 402 ///
501 502 503 504 505 506 507 508 ///
509 510 ///
601 602 603 604 605 606 607 608 ///
609 /// 
701 702 703 704 705 706 {
local o`o' = 0
}
if `rf' == 1 {
local o`osa' = -1.96
}
if `rf' == 2 {
local o`osa' = 1.96
}
local ll = 0.517
local sl = 20
if `osa' == 401 & `rf' == 1 {
local ll = 0.512
}
if `osa' == 401 & `rf' == 2 {
local ll = 0.522
}
if `osa' == 402 & `rf' == 1 {
local sl = 15
}
if `osa' == 402 & `rf' == 2 {
local sl = 25
}
local o502 = 0.785
local o503 = 0.79
local o504 = 0.65
local o505 = 0.65
local o506 = -0.055
local o507 = -0.164
local o508 = -0.164
local o509 = -0.01125
local o510 = -0.03
if `osa' == 502 & `rf' == 1 {
local o502 = 0.681
}
if `osa' == 502 & `rf' == 2 {
local o502 = 0.889
}
if `osa' == 503 & `rf' == 1 {
local o503 = 0.73
}
if `osa' == 503 & `rf' == 2 {
local o503 = 0.85
}
if `osa' == 504 & `rf' == 1 {
local o504 = 0.63
}
if `osa' == 504 & `rf' == 2 {
local o504 = 0.67
}
if `osa' == 505 & `rf' == 1 {
local o505 = 0.63
}
if `osa' == 505 & `rf' == 2 {
local o505 = 0.67
}
if `osa' == 506 & `rf' == 1 {
local o506 = -0.067
}
if `osa' == 506 & `rf' == 2 {
local o506 = -0.042
}
if `osa' == 507 & `rf' == 1 {
local o507 = -0.222
}
if `osa' == 507 & `rf' == 2 {
local o507 = -0.105
}
if `osa' == 508 & `rf' == 1 {
local o508 = -0.222
}
if `osa' == 508 & `rf' == 2 {
local o508 = -0.105
}
if `osa' == 509 & `rf' == 1 {
local o509 = -0.0135
}
if `osa' == 509 & `rf' == 2 {
local o509 = -0.009
}
if `osa' == 510 & `rf' == 1 {
local o510 = -0.036
}
if `osa' == 510 & `rf' == 2 {
local o510 = -0.024
}
local o601 = 3588
local o602 = 6222
local o603 = 4388
local o604 = 6222
local o605 = 8870
local o606 = 8870
local o607 = 8870
local o6081 = 14434
local o6091 = 15659
local o6010 = 2546
local o6011 = 2170
local o6020 = 3304
local o6021 = 2917
local o6030 = 7021
local o6031 = 7351
local o6040 = 14442
local o6041 = 12616
local o6050 = 4511
local o6051 = 3917
local o6060 = 10014
local o6061 = 10494
local o6070 = 14442
local o6071 = 12616
local o6082 = 2212
local o6092 = 4626
if `osa' == 601 & `rf' == 1 {
local o601 = 2816
local o6010 = 2462
local o6011 = 2090
}
if `osa' == 601 & `rf' == 2 {
local o601 = 4539
local o6010 = 2633
local o6011 = 2254
}
if `osa' == 602 & `rf' == 1 {
local o602 = 6222*0.9
local o6020 = 3026
local o6021 = 2701
}
if `osa' == 602 & `rf' == 2 {
local o602 = 6222*1.1
local o6020 = 3607
local o6021 = 3149
}
if `osa' == 603 & `rf' == 1 {
local o603 = 4388*0.9
local o6030 = 5852
local o6031 = 5923
}
if `osa' == 603 & `rf' == 2 {
local o603 = 4388*1.1
local o6030 = 8421
local o6031 = 8062
}
if `osa' == 604 & `rf' == 1 {
local o604 = 6222*0.9
local o6040 = 9929
local o6041 = 8484
}
if `osa' == 604 & `rf' == 2 {
local o604 = 6222*1.1
local o6040 = 21004
local o6041 = 18756
}
if `osa' == 605 & `rf' == 1 {
local o605 = 6804
local o6050 = 3947
local o6051 = 3480
}
if `osa' == 605 & `rf' == 2 {
local o605 = 10937
local o6050 = 5155
local o6051 = 4409
}
if `osa' == 606 & `rf' == 1 {
local o606 = 6804
local o6060 = 7615
local o6061 = 7701
}
if `osa' == 606 & `rf' == 2 {
local o606 = 10937
local o6060 = 13167
local o6061 = 14300
}
if `osa' == 607 & `rf' == 1 {
local o607 = 6804
local o6070 = 9929
local o6071 = 8484
}
if `osa' == 607 & `rf' == 2 {
local o607 = 10937
local o6070 = 21004
local o6071 = 18756
}
if `osa' == 608 & `rf' == 1 {
local o6081 = 14434*0.9
local o6082 = 2212*0.9
}
if `osa' == 608 & `rf' == 2 {
local o6081 = 14434*1.1
local o6082 = 2212*1.1
}
if `osa' == 609 & `rf' == 1 {
local o6091 = 15659*0.9
local o6092 = 4626*0.9
}
if `osa' == 609 & `rf' == 2 {
local o6091 = 15659*1.1
local o6092 = 4626*1.1
}
local o701 = 55
local o702 = 90
local o703 = 21.5
local o704 = 6
local o705 = 1.46
local o706 = 1.92
if `osa' == 701 & `rf' == 1 {
local o701 = 44
}
if `osa' == 701 & `rf' == 2 {
local o701 = 66
}
if `osa' == 702 & `rf' == 1 {
local o702 = 72
}
if `osa' == 702 & `rf' == 2 {
local o702 = 108
}
if `osa' == 703 & `rf' == 1 {
local o703 = 17.2
}
if `osa' == 703 & `rf' == 2 {
local o703 = 25.8
}
if `osa' == 704 & `rf' == 1 {
local o704 = 2
}
if `osa' == 704 & `rf' == 2 {
local o704 = 10
}
if `osa' == 705 & `rf' == 1 {
local o705 = 1.36
}
if `osa' == 705 & `rf' == 2 {
local o705 = 1.55
}
if `osa' == 706 & `rf' == 1 {
local o706 = 1.80
}
if `osa' == 706 & `rf' == 2 {
local o706 = 2.06
}
if `osa' <= 402 {
forval m = 0/1 {
use modstart, clear
forval c = 0/44 {
if `c' == 0 | `c' == 5 | `c' == 10 | `c' == 15 | `c' == 20 ///
| `c' == 25 |  `c' == 30 | `c' == 35 | `c' == 40 {
gen tyr = 100*(1-0.9776^(exp( ///
(0.4648*((age-60)/5)) + ///
(0.7744*cs) + ///
(0.3131*((sbp-120)/20)) + ///
(0.1002*(ldl+hdl+0.5-6)) + ///
(-0.2606*((hdl-1.3)/0.5)) + ///
(-0.1088*(cs*(age-60)/5)) + ///
(-0.0277*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0226*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0613*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 0
replace tyr = 100*(1-0.9605^(exp( ///
(0.3742*((age-60)/5)) + ///
(0.6012*cs) + ///
(0.2777*((sbp-120)/20)) + ///
(0.1458*(ldl+hdl+0.5-6)) + ///
(-0.2698*((hdl-1.3)/0.5)) + ///
(-0.0755*(cs*(age-60)/5)) + ///
(-0.0255*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0281*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0426*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 1
if `m' == 0 {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-`ll') if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-`sl' if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
if `c' == 0 {
gen LPAT=.
}
}
if `m' == 1 {
if `c' == 0 {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70)
gen LPAT=1 if vhr!=1 & cycle == `c'
replace vhr = 1 if lpa >= 90 & cycle == `c'
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70 | lpa >= 90) & MI == 0 & ST == 0
}
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-`ll') if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-`sl' if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-`ll') if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-`sl' if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
gen cumldl=.
gen mcldl=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen ldllog_`ii' = ldl*logf_`ii'
bysort ind (age) : gen cumldllog_`ii' = sum(ldllog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumldl = cumldllog_`ii' if age == `ii'
replace mcldl = cumldllog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumldl
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
gen cumsbp=.
gen mcsbp=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-2.1)/2.1)^(-2) if age <= `ii'
gen sbplog_`ii' = sbp*logf_`ii'
bysort ind (age) : gen cumsbplog_`ii' = sum(sbplog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumsbp = cumsbplog_`ii' if age == `ii'
replace mcsbp = cumsbplog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumsbp
replace mcldl = . if cycle!=`c'
replace mclpa = . if cycle!=`c'
replace mcsbp = . if cycle!=`c'
merge m:1 sex age using aveldl_cal, keep(1 3) nogen
gen errr = (aveldlub-aveldllb)/3.92
replace aveldl = aveldl+(`o201'*errr)
drop errr
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
gen errr = (avelpaub-avelpalb)/3.92
replace avelpa = avelpa+(`o202'*errr)
drop errr
merge m:1 sex age using avesbp_cal, keep(1 3) nogen
gen errr = (avesbpub-avesbplb)/3.92
replace avesbp = avesbp+(`o203'*errr)
drop errr
merge m:1 sex age using DMmod, keep(1 3) nogen
replace DMP = exp(ln(DMP)+(`o204'*errr))
drop errr
merge m:1 sex age using LSImod, keep(1 3) nogen
replace LSI = exp(ln(LSI)+(`o205'*errr))
drop errr
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
merge m:1 age sex using INC/`i'
drop _merge
rename (rate errr) (rate_`i' errr_`i')
}
replace rate_nfMI = exp(ln(rate_nfMI)+(`o101'*errr_nfMI))
replace rate_fMI = exp(ln(rate_fMI)+(`o102'*errr_fMI))
replace rate_nfIS = exp(ln(rate_nfIS)+(`o103'*errr_nfIS))
replace rate_fIS = exp(ln(rate_fIS)+(`o104'*errr_fIS))
replace rate_nfICH = exp(ln(rate_nfICH)+(`o105'*errr_nfICH))
replace rate_fICH = exp(ln(rate_fICH)+(`o106'*errr_fICH))
replace rate_blacdeath = exp(ln(rate_blacdeath)+(`o107'*errr_blacdeath))
replace rate_colcdeath = exp(ln(rate_colcdeath)+(`o108'*errr_colcdeath))
replace rate_oescdeath = exp(ln(rate_oescdeath)+(`o109'*errr_oescdeath))
replace rate_kidcdeath = exp(ln(rate_kidcdeath)+(`o110'*errr_kidcdeath))
replace rate_luncdeath = exp(ln(rate_luncdeath)+(`o111'*errr_luncdeath))
replace rate_ovacdeath = exp(ln(rate_ovacdeath)+(`o112'*errr_ovacdeath))
replace rate_pancdeath = exp(ln(rate_pancdeath)+(`o113'*errr_pancdeath))
replace rate_pneudeath = exp(ln(rate_pneudeath)+(`o114'*errr_pneudeath))
replace rate_copddeath = exp(ln(rate_copddeath)+(`o115'*errr_copddeath))
replace rate_alsdeath = exp(ln(rate_alsdeath)+(`o116'*errr_alsdeath))
replace rate_pddeath = exp(ln(rate_pddeath)+(`o117'*errr_pddeath))
replace rate_otherdeath = exp(ln(rate_otherdeath)+(`o118'*errr_otherdeath))
replace rate_t2d = exp(ln(rate_t2d)+(`o134'*errr_t2d))
replace rate_t2d = 0 if DM == 1
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
drop  errr_`i'
}
recast double rate_t2d-rate_nfICH
replace rate_t2d = rate_t2d*((exp(ln(1.21)+(`o312'*((ln(1.03)-ln(1.41))/3.92))))^(lsi-LSI))
foreach i in nf f {
replace rate_`i'MI=rate_`i'MI*((exp(ln(2.083)+(`o301'*((ln(2.222)-ln(2.000))/3.92))))^(mcldl-aveldl))
replace rate_`i'MI=rate_`i'MI*((exp(ln(1.0054)+(`o302'*((ln(1.0045)-ln(1.0062))/3.92))))^(mclpa-avelpa))
replace rate_`i'MI=rate_`i'MI*((exp(ln(1.058)+(`o303'*((ln(1.051)-ln(1.064))/3.92))))^(mcsbp-avesbp))
replace rate_`i'MI=rate_`i'MI*((exp(ln(1.43)+(`o304'*((ln(1.22)-ln(1.62))/3.92))))^(lsi-LSI))
replace rate_`i'MI=rate_`i'MI/(1+(((exp(ln(1.26)+(`o305'*((ln(1.40)-ln(1.08))/3.92))))-1)*DMP)) if DM == 0
replace rate_`i'MI=(exp(ln(1.26)+(`o305'*((ln(1.40)-ln(1.08))/3.92))))*rate_`i'MI/(1+(((exp(ln(1.26)+(`o305'*((ln(1.40)-ln(1.08))/3.92))))-1)*DMP)) if DM == 1
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.08)+(`o306'*((ln(1.03)-ln(1.14))/3.92))))^(mcldl-aveldl))
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.0035)+(`o307'*((ln(1.0023)-ln(1.0045))/3.92))))^(mclpa-avelpa))
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.027)+(`o308'*((ln(1.018)-ln(1.037))/3.92))))^(mcsbp-avesbp))
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.33)+(`o309'*((ln(1.22)-ln(1.46))/3.92))))^(lsi-LSI))
replace rate_`i'IS=rate_`i'IS/(1+(((exp(ln(1.74)+(`o310'*((ln(2.47)-ln(1.19))/3.92))))-1)*DMP)) if DM == 0
replace rate_`i'IS=(exp(ln(1.74)+(`o310'*((ln(2.47)-ln(1.19))/3.92))))*rate_`i'IS/(1+(((exp(ln(1.74)+(`o310'*((ln(2.47)-ln(1.19))/3.92))))-1)*DMP)) if DM == 1
replace rate_`i'ICH=rate_`i'ICH*((exp(ln(1.039)+(`o311'*((ln(1.010)-ln(1.069))/3.92))))^(mcsbp-avesbp))
}
replace rate_blacdeath = rate_blacdeath*((exp(ln(2.52)+(`o313'*((ln(1.66)-ln(3.81))/3.92))))^(lsi-LSI))
replace rate_colcdeath = rate_colcdeath*((exp(ln(1.24)+(`o314'*((ln(1.06)-ln(1.44))/3.92))))^(lsi-LSI))
replace rate_oescdeath = rate_oescdeath*((exp(ln(3.67)+(`o315'*((ln(1.67)-ln(8.02))/3.92))))^(lsi-LSI))
replace rate_kidcdeath = rate_kidcdeath*((exp(ln(1.69)+(`o316'*((ln(1.04)-ln(3.05))/3.92))))^(lsi-LSI))
replace rate_luncdeath = rate_luncdeath*((exp(ln(13.64)+(`o317'*((ln(8.85)-ln(21.03))/3.92))))^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_luncdeath = rate_luncdeath*((exp(ln(13.64)+(`o317'*((ln(8.85)-ln(21.03))/3.92))))^(0.692*2)) if lsi-LSI > 0.694*2
replace rate_ovacdeath = rate_ovacdeath*((exp(ln(1.27)+(`o318'*((ln(1.04)-ln(1.57))/3.92))))^(lsi-LSI))
replace rate_pancdeath = rate_pancdeath*((exp(ln(2.13)+(`o319'*((ln(1.15)-ln(3.90))/3.92))))^(lsi-LSI))
replace rate_pneudeath = rate_pneudeath*((exp(ln(1.016)+(`o320'*((ln(1.008)-ln(1.025))/3.92))))^(mcsbp-avesbp))
replace rate_pneudeath = rate_pneudeath*((exp(ln(4.03)+(`o321'*((ln(3.16)-ln(5.11))/3.92))))^(lsi-LSI))
replace rate_copddeath = rate_copddeath*((exp(ln(13.64)+(`o322'*((ln(8.85)-ln(21.03))/3.92))))^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_copddeath = rate_copddeath*((exp(ln(13.64)+(`o322'*((ln(8.85)-ln(21.03))/3.92))))^(0.692*2)) if lsi-LSI > 0.694*2
replace rate_alsdeath = rate_alsdeath*((exp(ln(1.09)+(`o323'*((ln(1.03)-ln(1.14))/3.92))))^(mcldl-aveldl))
replace rate_pddeath = rate_pddeath*((exp(ln(0.48)+(`o324'*((ln(0.27)-ln(1.01))/3.92))))^(lsi-LSI))
recode rate_ovacdeath .=0
merge m:1 sex MI ST age using pevtpe, keep(1 3) nogen
replace ratenfMI = exp(ln(ratenfMI)+(`o119'*errrnfMI)) if MI == 1 & ST == 0
replace ratefMI = exp(ln(ratefMI)+(`o120'*errrfMI)) if MI == 1 & ST == 0
replace ratenfS = exp(ln(ratenfS)+(`o121'*errrnfS)) if MI == 1 & ST == 0
replace ratefS = exp(ln(ratefS)+(`o122'*errrfS)) if MI == 1 & ST == 0
replace rateothd = exp(ln(rateothd)+(`o123'*errrothd)) if MI == 1 & ST == 0
replace ratenfMI = exp(ln(ratenfMI)+(`o124'*errrnfMI)) if MI == 0 & ST == 1
replace ratefMI = exp(ln(ratefMI)+(`o125'*errrfMI)) if MI == 0 & ST == 1
replace ratenfS = exp(ln(ratenfS)+(`o126'*errrnfS)) if MI == 0 & ST == 1
replace ratefS = exp(ln(ratefS)+(`o127'*errrfS)) if MI == 0 & ST == 1
replace rateothd = exp(ln(rateothd)+(`o128'*errrothd)) if MI == 0 & ST == 1
replace ratenfMI = exp(ln(ratenfMI)+(`o129'*errrnfMI)) if MI == 1 & ST == 1
replace ratefMI = exp(ln(ratefMI)+(`o130'*errrfMI)) if MI == 1 & ST == 1
replace ratenfS = exp(ln(ratenfS)+(`o131'*errrnfS)) if MI == 1 & ST == 1
replace ratefS = exp(ln(ratefS)+(`o132'*errrfS)) if MI == 1 & ST == 1
replace rateothd = exp(ln(rateothd)+(`o133'*errrothd)) if MI == 1 & ST == 1
drop errrfMI-errrothd
sort ind age
gen ratesum0 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace ratesum0 = ratesum0+`var' if MI == 0 & ST == 0
}
gen tpsum0 = 1-exp(-ratesum0)
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = tpsum0*`var'/ratesum0 if MI == 0 & ST == 0
}
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = `var'+`var1' if MI == 0 & ST == 0
local var1 = "`var'"
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,rate_fMI) | inrange(rand,rate_nfMI,rate_fIS) | inrange(rand,rate_nfIS,rate_fICH)) & MI==0 & ST == 0 & cycle == `c'
replace MIE=1 if inrange(rand,rate_otherdeath,rate_nfMI) & MI== 0 & ST == 0 & cycle == `c'
replace STE=1 if inrange(rand,rate_nfMI,rate_nfICH) & MI== 0 & ST == 0 & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace ldl = ldl[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace sbp = sbp[_n-1]+0.91 if cycle[_n-1]==`c' & sex == 0
bysort ind (age) : replace sbp = sbp[_n-1]+0.56 if cycle[_n-1]==`c' & sex == 1
bysort ind (age) : replace LLT = LLT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace AHT = AHT[_n-1] if cycle[_n-1]==`c'
foreach var of varlist hdl-lsi LLT AHT {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT
}
save OSA/modend`m'_`osa'_`rf', replace
}
}

forval c = 1/2 {
forval i = 0/1 {
if `osa' <= 402 {
use OSA/modend`i'_`osa'_`rf', clear
}
else {
use OSA/modend`i'_0_1, clear
}
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
sort ind age
gen LPATT=1 if LPAT==1 & lpa >= 90
keep if cycle!=.

if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
replace UT = invlogit(xb+`o501'*errr)
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
replace UT = UT+(UT*0.0255*`o501')
replace UT = 0 if UT < 0
replace UT = 1 if UT > 1
}


sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*`o503'
gen double STOHSQL = STOHS*UT*`o504'
gen double DMOHSQL = DMOHS*UT*`o502'
gen double MISHSQL = MISHS*UT*`o505'
gen double MIDHSQL = MIDHS*UT*(`o502'+`o506')
gen double STDHSQL = STDHS*UT*(`o502'+`o507')
gen double MSDHSQL = MSDHS*UT*(`o502'+`o508')
replace MIOHSQL = MIOHSQL+`o509' if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL+`o509' if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL+`o509' if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL+`o509' if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL+`o510' if STE == 1 & DTE==.
replace MISHSQL = MISHSQL+`o510' if STE == 1 & DTE==.
replace STDHSQL = STDHSQL+`o510' if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL+`o510' if STE == 1 & DTE==.


if `c' == 1 {
gen double MIOHSHC = MIOHS*`o602'
gen double STOHSHC = STOHS*`o603'
gen double DMOHSHC = DMOHS*`o601'
gen double MISHSHC = MISHS*`o604'
gen double MIDHSHC = MIDHS*`o605'
gen double STDHSHC = STDHS*`o606'
gen double MSDHSHC = MSDHS*`o607'
gen double ACMIC = `o6081' if MIE == 1 & DTE == .
replace ACMIC = 0.233*`o6081' if MIE == 1 & DTE == 1
gen double ACSTC = `o6091' if STE == 1 & DTE ==.
replace ACSTC = 0.841*`o6091' if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+200 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+200+143+212 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}

if `c' == 2 {
gen double MIOHSHC = MIOHS*`o6020' if sex == 0
gen double STOHSHC = STOHS*`o6030' if sex == 0
gen double DMOHSHC = DMOHS*`o6010' if sex == 0
gen double MISHSHC = MISHS*`o6040' if sex == 0
gen double MIDHSHC = MIDHS*`o6050' if sex == 0
gen double STDHSHC = STDHS*`o6060' if sex == 0
gen double MSDHSHC = MSDHS*`o6070' if sex == 0
replace MIOHSHC = MIOHS*`o6021' if sex == 1
replace STOHSHC = STOHS*`o6031' if sex == 1
replace DMOHSHC = DMOHS*`o6011' if sex == 1
replace MISHSHC = MISHS*`o6041' if sex == 1
replace MIDHSHC = MIDHS*`o6051' if sex == 1
replace STDHSHC = STDHS*`o6061' if sex == 1
replace MSDHSHC = MSDHS*`o6071' if sex == 1
gen double ACMIC = `o6082' if MIE == 1 & DTE == .
replace ACMIC = 0.233*`o6082' if MIE == 1 & DTE == 1
gen double ACSTC = `o6092' if STE == 1 & DTE ==.
replace ACSTC = 0.841*`o6092' if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}



gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(`o705'*(1-WFP_GP))
gen STOHS_WFP = 1-(`o706'*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(`o706'*(1-WFP_GP))
gen MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-`o703')/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-`o703')/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-`o704')/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-`o703')/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-`o703'-`o704')/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-`o703'-`o704')/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-`o703'-`o704')/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-`o702')/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`o702')/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-`o702')/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-`o702')/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-`o702')/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-`o702')/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-`o702')/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-`o702')/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.



if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}



gen N = 1 if cycle == 0
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save OSA/tabres_`i'_`osa'_`rf'_`c', replace
}
}

/*
if `osa' <= 402 {
forval m = 0/1 {
erase OSA/modend`i'_`osa'_`rf'.dta
}
}
*/

}
}
}
clear
foreach osa in 0 ///
101 102 103 104 105 106 107 108 ///
109 110 111 112 113 114 115 116 ///
117 118 119 120 121 122 123 124 ///
125 126 127 128 129 130 131 132 133 134 ///
201 202 203 204 205 ///
301 302 303 304 305 306 307 308 ///
309 310 311 312 313 314 315 316 ///
317 318 319 320 321 322 323 324 ///
401 402 ///
501 502 503 504 505 506 507 508 509 510 ///
601 602 603 604 605 606 607 608 609 /// 
701 702 703 704 705 706 {
forval rf = 1/2 {
forval c = 1/2 {
use OSA/tabres_0_`osa'_`rf'_`c', clear
merge 1:1 _n using OSA/tabres_1_`osa'_`rf'_`c', nogen
gen double diff = val1-val0
expand 2 if stat=="TSC"
replace stat = "ICER" if _n == 41
replace diff = diff[38]/diff[37] if _n==41
keep if _n == 41
keep diff
gen osa = `osa'
gen rf = `rf'
gen country = `c'
save OSA/icer_`osa'_`rf'_`c', replace
}
}
}
clear
foreach osa in 0 ///
101 102 103 104 105 106 107 108 ///
109 110 111 112 113 114 115 116 ///
117 118 119 120 121 122 123 124 ///
125 126 127 128 129 130 131 132 133 134 ///
201 202 203 204 205 ///
301 302 303 304 305 306 307 308 ///
309 310 311 312 313 314 315 316 ///
317 318 319 320 321 322 323 324 ///
401 402 ///
501 502 503 504 505 506 507 508 509 510 ///
601 602 603 604 605 606 607 608 609  {
forval rf = 1/2 {
forval c = 1/2 {
append using OSA/icer_`osa'_`rf'_`c'
}
}
}
bysort country osa (rf) : gen double iceru = diff[_n+1]
keep if rf == 1
rename diff icerl
label variable icerl "Lower limit"
label variable iceru "Upper limit"
gen AA = ""
replace AA = "TP: Incident non-fatal MI" if osa == 101
replace AA = "TP: Incident fatal MI" if osa == 102
replace AA = "TP: Incident non-fatal IS" if osa == 103
replace AA = "TP: Incident fatal IS" if osa == 104
replace AA = "TP: Incident non-fatal ICH" if osa == 105
replace AA = "TP: Incident fatal ICH" if osa == 106
replace AA = "TP: Bladder cancer death " if osa == 107
replace AA = "TP: Colorectal cancer death " if osa == 108
replace AA = "TP: Oesophageal cancer death " if osa == 109
replace AA = "TP: Kidney cancer death " if osa == 110
replace AA = "TP: Lung cancer death " if osa == 111
replace AA = "TP: Ovarian cancer death " if osa == 112
replace AA = "TP: Pancreatic cancer death " if osa == 113
replace AA = "TP: Pneumonia death " if osa == 114
replace AA = "TP: COPD death " if osa == 115
replace AA = "TP: ALS death " if osa == 116
replace AA = "TP: Parksinson's disease death " if osa == 117
replace AA = "TP: Other death " if osa == 118
replace AA = "TP: Non-fatal MI following MI" if osa == 119
replace AA = "TP: Fatal MI following MI" if osa == 120
replace AA = "TP: Non-fatal stroke following MI" if osa == 121
replace AA = "TP: Fatal stroke following MI" if osa == 122
replace AA = "TP: Other death following MI" if osa == 123
replace AA = "TP: Non-fatal MI following stroke" if osa == 124
replace AA = "TP: Fatal MI following stroke" if osa == 125
replace AA = "TP: Non-fatal stroke following stroke" if osa == 126
replace AA = "TP: Fatal stroke following stroke" if osa == 127
replace AA = "TP: Other death following stroke" if osa == 128
replace AA = "TP: Non-fatal MI following MI and stroke" if osa == 129
replace AA = "TP: Fatal MI following MI and stroke" if osa == 130
replace AA = "TP: Non-fatal stroke following MI and stroke" if osa == 131
replace AA = "TP: Fatal stroke following MI and stroke" if osa == 132
replace AA = "TP: Other death following MI and stroke" if osa == 133
replace AA = "TP: Incidence of type 2 diabetes" if osa == 134
replace AA = "RF UKB: Mean cumulative LDL-C" if osa == 201
replace AA = "RF UKB: Mean cumulative Lp(a)" if osa == 202
replace AA = "RF UKB: Mean cumulative SBP" if osa == 203
replace AA = "RF UKB: Prevalence of type 2 diabetes" if osa == 204
replace AA = "RF UKB: Mean LSI" if osa == 205
replace AA = "RF OC: LDL-C on incident MI" if osa == 301
replace AA = "RF OC: Lp(a) on incident MI" if osa == 302
replace AA = "RF OC: SBP on incident MI" if osa == 303
replace AA = "RF OC: Smoking on incident MI" if osa == 304
replace AA = "RF OC: Type 2 diabetes on incident MI" if osa == 305
replace AA = "RF OC: LDL-C on incident IS" if osa == 306
replace AA = "RF OC: Lp(a) on incident IS" if osa == 307
replace AA = "RF OC: SBP on incident IS" if osa == 308
replace AA = "RF OC: Smoking on incident IS" if osa == 309
replace AA = "RF OC: Type 2 diabetes on incident IS" if osa == 310
replace AA = "RF OC: SBP on incident ICH" if osa == 311
replace AA = "RF OC: Smoking on incident type 2 diabetes" if osa == 312
replace AA = "RF OC: Smoking on death from bladder cancer" if osa == 313
replace AA = "RF OC: Smoking on death from colorectal cancer" if osa == 314
replace AA = "RF OC: Smoking on death from oesophageal cancer" if osa == 315
replace AA = "RF OC: Smoking on death from kidney cancer" if osa == 316
replace AA = "RF OC: Smoking on death from lung cancer" if osa == 317
replace AA = "RF OC: Smoking on ovarian cancer" if osa == 318
replace AA = "RF OC: Smoking on pancreatic cancer" if osa == 319
replace AA = "RF OC: SBP on death from Pneumonia" if osa == 320
replace AA = "RF OC: Smoking on death from Pneumonia" if osa == 321
replace AA = "RF OC: Smoking on death from COPD" if osa == 322
replace AA = "RF OC: LDL-C on death from ALS" if osa == 323
replace AA = "RF OC: Smoking on death from Parkinson's disease" if osa == 324
replace AA = "Effect of LDL-C lowering intervention" if osa == 401
replace AA = "Effect of SBP lowering intervention" if osa == 402
replace AA = "Chronic utility for no CVD or diabetes" if osa == 501
replace AA = "Chronic utility for diabetes" if osa == 502
replace AA = "Chronic utility for MI" if osa == 503
replace AA = "Chronic utility for stroke" if osa == 504
replace AA = "Chronic utility for MI and stroke" if osa == 505
replace AA = "Chronic disutility for MI in diabetes" if osa == 506
replace AA = "Chronic disutility for stroke in diabetes" if osa == 507
replace AA = "Chronic disutility for MI and stroke in diabetes" if osa == 508
replace AA = "Acute disutility for MI" if osa == 509
replace AA = "Acute disutility for stroke" if osa == 510
replace AA = "Chronic cost of diabetes" if osa == 601
replace AA = "Chronic cost of MI" if osa == 602
replace AA = "Chronic cost of stroke" if osa == 603
replace AA = "Chronic cost of MI and stroke" if osa == 604
replace AA = "Chronic cost of MI in diabetes" if osa == 605
replace AA = "Chronic cost of stroke in diabetes" if osa == 606
replace AA = "Chronic cost of MI and stroke in diabetes" if osa == 607
replace AA = "Acute cost of MI" if osa == 608
replace AA = "Acute cost of stroke" if osa == 609
save OSA/osares, replace
forval c = 1/2 {
if "`c'" == "1" {
local cc = "Australia"
local xlab = "8000(2000)16000"
}
else {
local cc = "UK"
local xlab = "-8000(2000)0"
}
use OSA/osares, clear
keep if country == `c'
sort osa
gen ref = icerl[1]
local ref = ref[1]
drop if osa == 0
gen sz = ((iceru-ref)^2)+((icerl-ref)^2)
sort sz
gen njm = _n
forval ii = 1/84 {
local `ii' = AA[`ii']
}
twoway ///
(bar icerl njm, horizontal base(`ref') color(magenta)) ///
(bar iceru njm, horizontal base(`ref') color(dknavy)) ///
, ylabel( ///
1 "`1'" ///
2 "`2'" ///
3 "`3'" ///
4 "`4'" ///
5 "`5'" ///
6 "`6'" ///
7 "`7'" ///
8 "`8'" ///
9 "`9'" ///
10 "`10'" ///
11 "`11'" ///
12 "`12'" ///
13 "`13'" ///
14 "`14'" ///
15 "`15'" ///
16 "`16'" ///
17 "`17'" ///
18 "`18'" ///
19 "`19'" ///
20 "`20'" ///
21 "`21'" ///
22 "`22'" ///
23 "`23'" ///
24 "`24'" ///
25 "`25'" ///
26 "`26'" ///
27 "`27'" ///
28 "`28'" ///
29 "`29'" ///
30 "`30'" ///
31 "`31'" ///
32 "`32'" ///
33 "`33'" ///
34 "`34'" ///
35 "`35'" ///
36 "`36'" ///
37 "`37'" ///
38 "`38'" ///
39 "`39'" ///
40 "`40'" ///
41 "`41'" ///
42 "`42'" ///
43 "`43'" ///
44 "`44'" ///
45 "`45'" ///
46 "`46'" ///
47 "`47'" ///
48 "`48'" ///
49 "`49'" ///
50 "`50'" ///
51 "`51'" ///
52 "`52'" ///
53 "`53'" ///
54 "`54'" ///
55 "`55'" ///
56 "`56'" ///
57 "`57'" ///
58 "`58'" ///
59 "`59'" ///
60 "`60'" ///
61 "`61'" ///
62 "`62'" ///
63 "`63'" ///
64 "`64'" ///
65 "`65'" ///
66 "`66'" ///
67 "`67'" ///
68 "`68'" ///
69 "`69'" ///
70 "`70'" ///
71 "`71'" ///
72 "`72'" ///
73 "`73'" ///
74 "`74'" ///
75 "`75'" ///
76 "`76'" ///
77 "`77'" ///
78 "`78'" ///
79 "`79'" ///
80 "`80'" ///
81 "`81'" ///
82 "`82'" ///
83 "`83'" ///
84 "`84'" ///
, angle(0) nogrid) ysize(2) xsize(1.4) ///
legend(position(12) region(lcolor(white)) cols(2)) ///
ytitle("") graphregion(color(white) margin(30 10 2 2)) xlabel(`xlab', format(%15.0fc)) ///
xtitle("ICER", margin(medium)) ///
title("`cc'", placement(west) size(medium) col(black))
graph save GPH/OSAT_`c', replace
}
texdoc stlog close

/***
\color{black}

\clearpage
\subsubsection{Results}

\color{Blue4}
***/

texdoc stlog
use OSA/osares, clear
list icerl iceru AA if country == 1 & osa !=0, separator(0)
list icerl iceru AA if country == 2 & osa !=0, separator(0)
texdoc stlog close
texdoc stlog, cmdlog
graph combine ///
GPH/OSAT_1.gph ///
GPH/OSAT_2.gph ///
, graphregion(color(white)) iscale(0.3) xsize(1.5) ysize(2.2) cols(2) 
texdoc graph, label(OSAfigs1) figure(h!) cabove fontface("Liberation Sans") ///
caption(Tornado diagrams for one-way sensitivity analyses. ///
These show the ICER at the lower and upper bounds of each model input.)
texdoc stlog close


/***
\color{black}

\clearpage
\subsection{Study 2}

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
quietly {
foreach osa in 0 ///
101 102 103 104 105 106 107 108 ///
109 110 111 112 113 114 115 116 ///
117 118 119 120 121 122 123 124 ///
125 126 127 128 129 130 131 132 133 134 ///
201 202 203 204 205 ///
301 302 303 304 305 306 307 308 ///
309 310 311 312 313 314 315 316 ///
317 318 319 320 321 322 323 324 ///
401 402 403 ///
501 502 503 504 505 506 507 508 509 510 ///
601 602 603 604 605 606 607 608 609 /// 
701 702 703 704 705 706 {
noisily di `osa'
forval rf = 1/2 {
foreach o in 0 ///
101 102 103 104 105 106 107 108 ///
109 110 111 112 113 114 115 116 ///
117 118 119 120 121 122 123 124 ///
125 126 127 128 129 130 131 132 ///
133 134 ///
201 202 203 204 205 ///
301 302 303 304 305 306 307 308 ///
309 310 311 312 313 314 315 316 ///
317 318 319 320 321 322 323 324 ///
401 402 403 ///
501 502 503 504 505 506 507 508 ///
509 510 ///
601 602 603 604 605 606 607 608 ///
609 /// 
701 702 703 704 705 706 {
local o`o' = 0
}
if `rf' == 1 {
local o`osa' = -1.96
}
if `rf' == 2 {
local o`osa' = 1.96
}
local ll = 0.517
local sl = 20
local lp = 0.975
if `osa' == 401 & `rf' == 1 {
local ll = 0.512
}
if `osa' == 401 & `rf' == 2 {
local ll = 0.522
}
if `osa' == 402 & `rf' == 1 {
local sl = 15
}
if `osa' == 402 & `rf' == 2 {
local sl = 25
}
if `osa' == 403 & `rf' == 1 {
local lp = 0.94
}
if `osa' == 403 & `rf' == 2 {
local lp = 1
}
local o502 = 0.785
local o503 = 0.79
local o504 = 0.65
local o505 = 0.65
local o506 = -0.055
local o507 = -0.164
local o508 = -0.164
local o509 = -0.01125
local o510 = -0.03
if `osa' == 502 & `rf' == 1 {
local o502 = 0.681
}
if `osa' == 502 & `rf' == 2 {
local o502 = 0.889
}
if `osa' == 503 & `rf' == 1 {
local o503 = 0.73
}
if `osa' == 503 & `rf' == 2 {
local o503 = 0.85
}
if `osa' == 504 & `rf' == 1 {
local o504 = 0.63
}
if `osa' == 504 & `rf' == 2 {
local o504 = 0.67
}
if `osa' == 505 & `rf' == 1 {
local o505 = 0.63
}
if `osa' == 505 & `rf' == 2 {
local o505 = 0.67
}
if `osa' == 506 & `rf' == 1 {
local o506 = -0.067
}
if `osa' == 506 & `rf' == 2 {
local o506 = -0.042
}
if `osa' == 507 & `rf' == 1 {
local o507 = -0.222
}
if `osa' == 507 & `rf' == 2 {
local o507 = -0.105
}
if `osa' == 508 & `rf' == 1 {
local o508 = -0.222
}
if `osa' == 508 & `rf' == 2 {
local o508 = -0.105
}
if `osa' == 509 & `rf' == 1 {
local o509 = -0.0135
}
if `osa' == 509 & `rf' == 2 {
local o509 = -0.009
}
if `osa' == 510 & `rf' == 1 {
local o510 = -0.036
}
if `osa' == 510 & `rf' == 2 {
local o510 = -0.024
}

local o601 = 3588
local o602 = 6222
local o603 = 4388
local o604 = 6222
local o605 = 8870
local o606 = 8870
local o607 = 8870
local o6081 = 14434
local o6091 = 15659
local o6010 = 2546
local o6011 = 2170
local o6020 = 3304
local o6021 = 2917
local o6030 = 7021
local o6031 = 7351
local o6040 = 14442
local o6041 = 12616
local o6050 = 4511
local o6051 = 3917
local o6060 = 10014
local o6061 = 10494
local o6070 = 14442
local o6071 = 12616
local o6082 = 2212
local o6092 = 4626
if `osa' == 601 & `rf' == 1 {
local o601 = 2816
local o6010 = 2462
local o6011 = 2090
}
if `osa' == 601 & `rf' == 2 {
local o601 = 4539
local o6010 = 2633
local o6011 = 2254
}
if `osa' == 602 & `rf' == 1 {
local o602 = 6222*0.9
local o6020 = 3026
local o6021 = 2701
}
if `osa' == 602 & `rf' == 2 {
local o602 = 6222*1.1
local o6020 = 3607
local o6021 = 3149
}
if `osa' == 603 & `rf' == 1 {
local o603 = 4388*0.9
local o6030 = 5852
local o6031 = 5923
}
if `osa' == 603 & `rf' == 2 {
local o603 = 4388*1.1
local o6030 = 8421
local o6031 = 8062
}
if `osa' == 604 & `rf' == 1 {
local o604 = 6222*0.9
local o6040 = 9929
local o6041 = 8484
}
if `osa' == 604 & `rf' == 2 {
local o604 = 6222*1.1
local o6040 = 21004
local o6041 = 18756
}
if `osa' == 605 & `rf' == 1 {
local o605 = 6804
local o6050 = 3947
local o6051 = 3480
}
if `osa' == 605 & `rf' == 2 {
local o605 = 10937
local o6050 = 5155
local o6051 = 4409
}
if `osa' == 606 & `rf' == 1 {
local o606 = 6804
local o6060 = 7615
local o6061 = 7701
}
if `osa' == 606 & `rf' == 2 {
local o606 = 10937
local o6060 = 13167
local o6061 = 14300
}
if `osa' == 607 & `rf' == 1 {
local o607 = 6804
local o6070 = 9929
local o6071 = 8484
}
if `osa' == 607 & `rf' == 2 {
local o607 = 10937
local o6070 = 21004
local o6071 = 18756
}
if `osa' == 608 & `rf' == 1 {
local o6081 = 14434*0.9
local o6082 = 2212*0.9
}
if `osa' == 608 & `rf' == 2 {
local o6081 = 14434*1.1
local o6082 = 2212*1.1
}
if `osa' == 609 & `rf' == 1 {
local o6091 = 15659*0.9
local o6092 = 4626*0.9
}
if `osa' == 609 & `rf' == 2 {
local o6091 = 15659*1.1
local o6092 = 4626*1.1
}
local o701 = 55
local o702 = 90
local o703 = 21.5
local o704 = 6
local o705 = 1.46
local o706 = 1.92
if `osa' == 701 & `rf' == 1 {
local o701 = 44
}
if `osa' == 701 & `rf' == 2 {
local o701 = 66
}
if `osa' == 702 & `rf' == 1 {
local o702 = 72
}
if `osa' == 702 & `rf' == 2 {
local o702 = 108
}
if `osa' == 703 & `rf' == 1 {
local o703 = 17.2
}
if `osa' == 703 & `rf' == 2 {
local o703 = 25.8
}
if `osa' == 704 & `rf' == 1 {
local o704 = 2
}
if `osa' == 704 & `rf' == 2 {
local o704 = 10
}
if `osa' == 705 & `rf' == 1 {
local o705 = 1.36
}
if `osa' == 705 & `rf' == 2 {
local o705 = 1.55
}
if `osa' == 706 & `rf' == 1 {
local o706 = 1.80
}
if `osa' == 706 & `rf' == 2 {
local o706 = 2.06
}
if `osa' <= 403 {
forval m = 0/1 {
use modstart2, clear
gen LPAT=.
gen LPT=.
forval c = 0/44 {
if `c' == 0 | `c' == 5 | `c' == 10 | `c' == 15 | `c' == 20 ///
| `c' == 25 |  `c' == 30 | `c' == 35 | `c' == 40 {
gen tyr = 100*(1-0.9776^(exp( ///
(0.4648*((age-60)/5)) + ///
(0.7744*cs) + ///
(0.3131*((sbp-120)/20)) + ///
(0.1002*(ldl+hdl+0.5-6)) + ///
(-0.2606*((hdl-1.3)/0.5)) + ///
(-0.1088*(cs*(age-60)/5)) + ///
(-0.0277*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0226*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0613*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 0
replace tyr = 100*(1-0.9605^(exp( ///
(0.3742*((age-60)/5)) + ///
(0.6012*cs) + ///
(0.2777*((sbp-120)/20)) + ///
(0.1458*(ldl+hdl+0.5-6)) + ///
(-0.2698*((hdl-1.3)/0.5)) + ///
(-0.0755*(cs*(age-60)/5)) + ///
(-0.0255*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0281*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0426*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 1
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-`ll') if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-`sl' if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-`ll') if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-`sl' if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
replace vhr = 1 if MI == 1 | ST == 1
if `m' == 1 {
replace LPAT=1 if vhr==1 & cycle == `c'
replace LPT=1 if lpa >= 90 & LPAT==1 & cycle == `c' & vhr == 1
bysort ind (age) : replace lpa = lpa*(1-`lp') if cycle == `c' & LPT == 1 & LPT[_n-1]!=1
}
gen cumldl=.
gen mcldl=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen ldllog_`ii' = ldl*logf_`ii'
bysort ind (age) : gen cumldllog_`ii' = sum(ldllog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumldl = cumldllog_`ii' if age == `ii'
replace mcldl = cumldllog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumldl
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
gen cumsbp=.
gen mcsbp=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-2.1)/2.1)^(-2) if age <= `ii'
gen sbplog_`ii' = sbp*logf_`ii'
bysort ind (age) : gen cumsbplog_`ii' = sum(sbplog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumsbp = cumsbplog_`ii' if age == `ii'
replace mcsbp = cumsbplog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumsbp
replace mcldl = . if cycle!=`c'
replace mclpa = . if cycle!=`c'
replace mcsbp = . if cycle!=`c'
merge m:1 sex age using aveldl_cal, keep(1 3) nogen
gen errr = (aveldlub-aveldllb)/3.92
replace aveldl = aveldl+(`o201'*errr)
drop errr
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
gen errr = (aveldlub-aveldllb)/3.92
replace avelpa = avelpa+(`o202'*errr)
drop errr
merge m:1 sex age using avesbp_cal, keep(1 3) nogen
gen errr = (aveldlub-aveldllb)/3.92
replace avesbp = avesbp+(`o203'*errr)
drop errr
merge m:1 sex age using DMmod, keep(1 3) nogen
replace DMP = exp(ln(DMP)+(`o204'*errr))
drop errr
merge m:1 sex age using LSImod, keep(1 3) nogen
replace LSI = exp(ln(LSI)+(`o205'*errr))
drop errr
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
merge m:1 age sex using INC/`i'
drop _merge
rename (rate errr) (rate_`i' errr_`i')
}
replace rate_nfMI = exp(ln(rate_nfMI)+(`o101'*errr_nfMI))
replace rate_fMI = exp(ln(rate_fMI)+(`o102'*errr_fMI))
replace rate_nfIS = exp(ln(rate_nfIS)+(`o103'*errr_nfIS))
replace rate_fIS = exp(ln(rate_fIS)+(`o104'*errr_fIS))
replace rate_nfICH = exp(ln(rate_nfICH)+(`o105'*errr_nfICH))
replace rate_fICH = exp(ln(rate_fICH)+(`o106'*errr_fICH))
replace rate_blacdeath = exp(ln(rate_blacdeath)+(`o107'*errr_blacdeath))
replace rate_colcdeath = exp(ln(rate_colcdeath)+(`o108'*errr_colcdeath))
replace rate_oescdeath = exp(ln(rate_oescdeath)+(`o109'*errr_oescdeath))
replace rate_kidcdeath = exp(ln(rate_kidcdeath)+(`o110'*errr_kidcdeath))
replace rate_luncdeath = exp(ln(rate_luncdeath)+(`o111'*errr_luncdeath))
replace rate_ovacdeath = exp(ln(rate_ovacdeath)+(`o112'*errr_ovacdeath))
replace rate_pancdeath = exp(ln(rate_pancdeath)+(`o113'*errr_pancdeath))
replace rate_pneudeath = exp(ln(rate_pneudeath)+(`o114'*errr_pneudeath))
replace rate_copddeath = exp(ln(rate_copddeath)+(`o115'*errr_copddeath))
replace rate_alsdeath = exp(ln(rate_alsdeath)+(`o116'*errr_alsdeath))
replace rate_pddeath = exp(ln(rate_pddeath)+(`o117'*errr_pddeath))
replace rate_otherdeath = exp(ln(rate_otherdeath)+(`o118'*errr_otherdeath))
replace rate_t2d = exp(ln(rate_t2d)+(`o134'*errr_t2d))
replace rate_t2d = 0 if DM == 1
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
drop  errr_`i'
}
recast double rate_t2d-rate_nfICH
merge m:1 sex MI ST age using pevtpe, keep(1 3) nogen
replace ratenfMI = exp(ln(ratenfMI)+(`o119'*errrnfMI)) if MI == 1 & ST == 0
replace ratefMI = exp(ln(ratefMI)+(`o120'*errrfMI)) if MI == 1 & ST == 0
replace ratenfS = exp(ln(ratenfS)+(`o121'*errrnfS)) if MI == 1 & ST == 0
replace ratefS = exp(ln(ratefS)+(`o122'*errrfS)) if MI == 1 & ST == 0
replace rateothd = exp(ln(rateothd)+(`o123'*errrothd)) if MI == 1 & ST == 0
replace ratenfMI = exp(ln(ratenfMI)+(`o124'*errrnfMI)) if MI == 0 & ST == 1
replace ratefMI = exp(ln(ratefMI)+(`o125'*errrfMI)) if MI == 0 & ST == 1
replace ratenfS = exp(ln(ratenfS)+(`o126'*errrnfS)) if MI == 0 & ST == 1
replace ratefS = exp(ln(ratefS)+(`o127'*errrfS)) if MI == 0 & ST == 1
replace rateothd = exp(ln(rateothd)+(`o128'*errrothd)) if MI == 0 & ST == 1
replace ratenfMI = exp(ln(ratenfMI)+(`o129'*errrnfMI)) if MI == 1 & ST == 1
replace ratefMI = exp(ln(ratefMI)+(`o130'*errrfMI)) if MI == 1 & ST == 1
replace ratenfS = exp(ln(ratenfS)+(`o131'*errrnfS)) if MI == 1 & ST == 1
replace ratefS = exp(ln(ratefS)+(`o132'*errrfS)) if MI == 1 & ST == 1
replace rateothd = exp(ln(rateothd)+(`o133'*errrothd)) if MI == 1 & ST == 1
replace rate_t2d = rate_t2d*((exp(ln(1.21)+(`o312'*((ln(1.03)-ln(1.41))/3.92))))^(lsi-LSI))
foreach i in nf f {
replace rate_`i'MI=rate_`i'MI*((exp(ln(2.083)+(`o301'*((ln(2.222)-ln(2.000))/3.92))))^(mcldl-aveldl))
replace rate_`i'MI=rate_`i'MI*((exp(ln(1.0054)+(`o302'*((ln(1.0045)-ln(1.0062))/3.92))))^(mclpa-avelpa))
replace rate_`i'MI=rate_`i'MI*((exp(ln(1.058)+(`o303'*((ln(1.051)-ln(1.064))/3.92))))^(mcsbp-avesbp))
replace rate_`i'MI=rate_`i'MI*((exp(ln(1.43)+(`o304'*((ln(1.22)-ln(1.62))/3.92))))^(lsi-LSI))
replace rate_`i'MI=rate_`i'MI/(1+(((exp(ln(1.26)+(`o305'*((ln(1.40)-ln(1.08))/3.92))))-1)*DMP)) if DM == 0
replace rate_`i'MI=(exp(ln(1.26)+(`o305'*((ln(1.40)-ln(1.08))/3.92))))*rate_`i'MI/(1+(((exp(ln(1.26)+(`o305'*((ln(1.40)-ln(1.08))/3.92))))-1)*DMP)) if DM == 1
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.08)+(`o306'*((ln(1.03)-ln(1.14))/3.92))))^(mcldl-aveldl))
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.0035)+(`o307'*((ln(1.0023)-ln(1.0045))/3.92))))^(mclpa-avelpa))
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.027)+(`o308'*((ln(1.018)-ln(1.037))/3.92))))^(mcsbp-avesbp))
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.33)+(`o309'*((ln(1.22)-ln(1.46))/3.92))))^(lsi-LSI))
replace rate_`i'IS=rate_`i'IS/(1+(((exp(ln(1.74)+(`o310'*((ln(2.47)-ln(1.19))/3.92))))-1)*DMP)) if DM == 0
replace rate_`i'IS=(exp(ln(1.74)+(`o310'*((ln(2.47)-ln(1.19))/3.92))))*rate_`i'IS/(1+(((exp(ln(1.74)+(`o310'*((ln(2.47)-ln(1.19))/3.92))))-1)*DMP)) if DM == 1
replace rate_`i'ICH=rate_`i'ICH*((exp(ln(1.039)+(`o311'*((ln(1.010)-ln(1.069))/3.92))))^(mcsbp-avesbp))
replace rate`i'MI=rate`i'MI*((exp(ln(1.0054)+(`o302'*((ln(1.0045)-ln(1.0062))/3.92))))^(mclpa-avelpa))
replace rate`i'S=rate`i'S*((exp(ln(1.0035)+(`o307'*((ln(1.0023)-ln(1.0045))/3.92))))^(mclpa-avelpa))
}
replace rate_blacdeath = rate_blacdeath*((exp(ln(2.52)+(`o313'*((ln(1.66)-ln(3.81))/3.92))))^(lsi-LSI))
replace rate_colcdeath = rate_colcdeath*((exp(ln(1.24)+(`o314'*((ln(1.06)-ln(1.44))/3.92))))^(lsi-LSI))
replace rate_oescdeath = rate_oescdeath*((exp(ln(3.67)+(`o315'*((ln(1.67)-ln(8.02))/3.92))))^(lsi-LSI))
replace rate_kidcdeath = rate_kidcdeath*((exp(ln(1.69)+(`o316'*((ln(1.04)-ln(3.05))/3.92))))^(lsi-LSI))
replace rate_luncdeath = rate_luncdeath*((exp(ln(13.64)+(`o317'*((ln(8.85)-ln(21.03))/3.92))))^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_luncdeath = rate_luncdeath*((exp(ln(13.64)+(`o317'*((ln(8.85)-ln(21.03))/3.92))))^(0.692*2)) if lsi-LSI > 0.694*2
replace rate_ovacdeath = rate_ovacdeath*((exp(ln(1.27)+(`o318'*((ln(1.04)-ln(1.57))/3.92))))^(lsi-LSI))
replace rate_pancdeath = rate_pancdeath*((exp(ln(2.13)+(`o319'*((ln(1.15)-ln(3.90))/3.92))))^(lsi-LSI))
replace rate_pneudeath = rate_pneudeath*((exp(ln(1.016)+(`o320'*((ln(1.008)-ln(1.025))/3.92))))^(mcsbp-avesbp))
replace rate_pneudeath = rate_pneudeath*((exp(ln(4.03)+(`o321'*((ln(3.16)-ln(5.11))/3.92))))^(lsi-LSI))
replace rate_copddeath = rate_copddeath*((exp(ln(13.64)+(`o322'*((ln(8.85)-ln(21.03))/3.92))))^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_copddeath = rate_copddeath*((exp(ln(13.64)+(`o322'*((ln(8.85)-ln(21.03))/3.92))))^(0.692*2)) if lsi-LSI > 0.694*2
replace rate_alsdeath = rate_alsdeath*((exp(ln(1.09)+(`o323'*((ln(1.03)-ln(1.14))/3.92))))^(mcldl-aveldl))
replace rate_pddeath = rate_pddeath*((exp(ln(0.48)+(`o324'*((ln(0.27)-ln(1.01))/3.92))))^(lsi-LSI))
recode rate_ovacdeath .=0
drop errrfMI-errrothd
sort ind age
gen ratesum0 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace ratesum0 = ratesum0+`var' if MI == 0 & ST == 0
}
gen tpsum0 = 1-exp(-ratesum0)
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = tpsum0*`var'/ratesum0 if MI == 0 & ST == 0
}
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = `var'+`var1' if MI == 0 & ST == 0
local var1 = "`var'"
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,rate_fMI) | inrange(rand,rate_nfMI,rate_fIS) | inrange(rand,rate_nfIS,rate_fICH)) & MI==0 & ST == 0 & cycle == `c'
replace MIE=1 if inrange(rand,rate_otherdeath,rate_nfMI) & MI== 0 & ST == 0 & cycle == `c'
replace STE=1 if inrange(rand,rate_nfMI,rate_nfICH) & MI== 0 & ST == 0 & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace ldl = ldl[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace sbp = sbp[_n-1]+0.91 if cycle[_n-1]==`c' & sex == 0
bysort ind (age) : replace sbp = sbp[_n-1]+0.56 if cycle[_n-1]==`c' & sex == 1
bysort ind (age) : replace LLT = LLT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace AHT = AHT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace LPT = LPT[_n-1] if cycle[_n-1]==`c'

foreach var of varlist hdl-lsi LLT AHT LPT {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT LPT
}
save OSA/modend2_`m'_`osa'_`rf', replace
}
}

if `osa' == 0 | inrange(`osa',119,134) | `osa' == 202 | `osa' == 205 | `osa' == 302 | `osa' == 307 | `osa' == 312  | `osa' == 403 {
forval m = 0/1 {
use modstartsp, clear
if `m' == 0 {
gen LPAT=.
gen LPT=.
}
if `m' == 1 {
gen LPAT=1 if cycle == 0
gen LPT=1 if lpa >= 90 & cycle == 0
}
forval c = 0/44 {
if `m' == 1 {
bysort ind (age) : replace lpa = lpa*(1-`lp') if cycle == `c' & LPT == 1 & LPT[_n-1]!=1
}
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
replace mclpa = . if cycle!=`c'
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
gen errr = (avelpaub-avelpalb)/3.92
replace avelpa = avelpa+(`o202'*errr)
drop errr
merge m:1 sex age using LSImod, keep(1 3) nogen
replace LSI = exp(ln(LSI)+(`o205'*errr))
drop errr
merge m:1 age sex using INC/t2d
drop _merge
rename (rate errr) (rate_t2d errr_t2d)
replace rate_t2d = exp(ln(rate_t2d)+(`o134'*errr_t2d))
drop errr_t2d
replace rate_t2d = 0 if DM == 1
recast double rate_t2d
merge m:1 sex MI ST age using pevtpe, keep(1 3) nogen
replace ratenfMI = exp(ln(ratenfMI)+(`o119'*errrnfMI)) if MI == 1 & ST == 0
replace ratefMI = exp(ln(ratefMI)+(`o120'*errrfMI)) if MI == 1 & ST == 0
replace ratenfS = exp(ln(ratenfS)+(`o121'*errrnfS)) if MI == 1 & ST == 0
replace ratefS = exp(ln(ratefS)+(`o122'*errrfS)) if MI == 1 & ST == 0
replace rateothd = exp(ln(rateothd)+(`o123'*errrothd)) if MI == 1 & ST == 0
replace ratenfMI = exp(ln(ratenfMI)+(`o124'*errrnfMI)) if MI == 0 & ST == 1
replace ratefMI = exp(ln(ratefMI)+(`o125'*errrfMI)) if MI == 0 & ST == 1
replace ratenfS = exp(ln(ratenfS)+(`o126'*errrnfS)) if MI == 0 & ST == 1
replace ratefS = exp(ln(ratefS)+(`o127'*errrfS)) if MI == 0 & ST == 1
replace rateothd = exp(ln(rateothd)+(`o128'*errrothd)) if MI == 0 & ST == 1
replace ratenfMI = exp(ln(ratenfMI)+(`o129'*errrnfMI)) if MI == 1 & ST == 1
replace ratefMI = exp(ln(ratefMI)+(`o130'*errrfMI)) if MI == 1 & ST == 1
replace ratenfS = exp(ln(ratenfS)+(`o131'*errrnfS)) if MI == 1 & ST == 1
replace ratefS = exp(ln(ratefS)+(`o132'*errrfS)) if MI == 1 & ST == 1
replace rateothd = exp(ln(rateothd)+(`o133'*errrothd)) if MI == 1 & ST == 1
replace rate_t2d = rate_t2d*((exp(ln(1.21)+(`o312'*((ln(1.03)-ln(1.41))/3.92))))^(lsi-LSI))
foreach i in nf f {
replace rate`i'MI=rate`i'MI*((exp(ln(1.0054)+(`o302'*((ln(1.0045)-ln(1.0062))/3.92))))^(mclpa-avelpa))
replace rate`i'S=rate`i'S*((exp(ln(1.0035)+(`o307'*((ln(1.0023)-ln(1.0045))/3.92))))^(mclpa-avelpa))
}
drop errrfMI-errrothd
sort ind age
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
foreach var of varlist lpa lsi {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT LPT
}
save OSA/modendsp`m'_`osa'_`rf', replace
}
}

forval c = 1/2 {
forval ii = 0/1 {
if `osa' <= 403 {
use OSA/modend2_`ii'_`osa'_`rf', clear
}
else {
use OSA/modend2_`ii'_0_1, clear
}
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.

if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
replace UT = invlogit(xb+`o501'*errr)
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
replace UT = UT+(UT*0.0255*`o501')
replace UT = 0 if UT < 0
replace UT = 1 if UT > 1
}

sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*`o503'
gen double STOHSQL = STOHS*UT*`o504'
gen double DMOHSQL = DMOHS*UT*`o502'
gen double MISHSQL = MISHS*UT*`o505'
gen double MIDHSQL = MIDHS*UT*(`o502'+`o506')
gen double STDHSQL = STDHS*UT*(`o502'+`o507')
gen double MSDHSQL = MSDHS*UT*(`o502'+`o508')
replace MIOHSQL = MIOHSQL+`o509' if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL+`o509' if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL+`o509' if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL+`o509' if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL+`o510' if STE == 1 & DTE==.
replace MISHSQL = MISHSQL+`o510' if STE == 1 & DTE==.
replace STDHSQL = STDHSQL+`o510' if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL+`o510' if STE == 1 & DTE==.



if `c' == 1 {
gen double MIOHSHC = MIOHS*`o602'
gen double STOHSHC = STOHS*`o603'
gen double DMOHSHC = DMOHS*`o601'
gen double MISHSHC = MISHS*`o604'
gen double MIDHSHC = MIDHS*`o605'
gen double STDHSHC = STDHS*`o606'
gen double MSDHSHC = MSDHS*`o607'
gen double ACMIC = `o6081' if MIE == 1 & DTE == .
replace ACMIC = 0.233*`o6081' if MIE == 1 & DTE == 1
gen double ACSTC = `o6091' if STE == 1 & DTE ==.
replace ACSTC = 0.841*`o6091' if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+200 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+200+143+212 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
replace DRUGSHC = DRUGSHC+4360 if LPT == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}

if `c' == 2 {
gen double MIOHSHC = MIOHS*`o6020' if sex == 0
gen double STOHSHC = STOHS*`o6030' if sex == 0
gen double DMOHSHC = DMOHS*`o6010' if sex == 0
gen double MISHSHC = MISHS*`o6040' if sex == 0
gen double MIDHSHC = MIDHS*`o6050' if sex == 0
gen double STDHSHC = STDHS*`o6060' if sex == 0
gen double MSDHSHC = MSDHS*`o6070' if sex == 0
replace MIOHSHC = MIOHS*`o6021' if sex == 1
replace STOHSHC = STOHS*`o6031' if sex == 1
replace DMOHSHC = DMOHS*`o6011' if sex == 1
replace MISHSHC = MISHS*`o6041' if sex == 1
replace MIDHSHC = MIDHS*`o6051' if sex == 1
replace STDHSHC = STDHS*`o6061' if sex == 1
replace MSDHSHC = MSDHS*`o6071' if sex == 1
gen double ACMIC = `o6082' if MIE == 1 & DTE == .
replace ACMIC = 0.233*`o6082' if MIE == 1 & DTE == 1
gen double ACSTC = `o6092' if STE == 1 & DTE ==.
replace ACSTC = 0.841*`o6092' if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}






gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(`o705'*(1-WFP_GP))
gen STOHS_WFP = 1-(`o706'*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(`o706'*(1-WFP_GP))
gen MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-`o703')/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-`o703')/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-`o704')/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-`o703')/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-`o703'-`o704')/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-`o703'-`o704')/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-`o703'-`o704')/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-`o702')/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`o702')/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-`o702')/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-`o702')/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-`o702')/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-`o702')/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-`o702')/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-`o702')/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.


if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}

gen N = 1 if cycle == 0
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`ii'
save OSA/tabres2_`ii'_`osa'_`rf'_`c', replace
}
forval i = 0/1 {
if inrange(`osa',119,134) | `osa' == 202 | `osa' == 205 | `osa' == 302 | `osa' == 307 | `osa' == 312  | `osa' == 403 {
use OSA/modendsp`i'_`osa'_`rf', clear
}
else {
use OSA/modendsp`i'_0_1, clear
}
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.

if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
replace UT = invlogit(xb+`o501'*errr)
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
replace UT = UT+(UT*0.0255*`o501')
replace UT = 0 if UT < 0
replace UT = 1 if UT > 1
}


sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*`o503'
gen double STOHSQL = STOHS*UT*`o504'
gen double DMOHSQL = DMOHS*UT*`o502'
gen double MISHSQL = MISHS*UT*`o505'
gen double MIDHSQL = MIDHS*UT*(`o502'+`o506')
gen double STDHSQL = STDHS*UT*(`o502'+`o507')
gen double MSDHSQL = MSDHS*UT*(`o502'+`o508')
replace MIOHSQL = MIOHSQL+`o509' if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL+`o509' if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL+`o509' if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL+`o509' if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL+`o510' if STE == 1 & DTE==.
replace MISHSQL = MISHSQL+`o510' if STE == 1 & DTE==.
replace STDHSQL = STDHSQL+`o510' if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL+`o510' if STE == 1 & DTE==.



if `c' == 1 {
gen double MIOHSHC = MIOHS*`o602'
gen double STOHSHC = STOHS*`o603'
gen double DMOHSHC = DMOHS*`o601'
gen double MISHSHC = MISHS*`o604'
gen double MIDHSHC = MIDHS*`o605'
gen double STDHSHC = STDHS*`o606'
gen double MSDHSHC = MSDHS*`o607'
gen double ACMIC = `o6081' if MIE == 1 & DTE == .
replace ACMIC = 0.233*`o6081' if MIE == 1 & DTE == 1
gen double ACSTC = `o6091' if STE == 1 & DTE ==.
replace ACSTC = 0.841*`o6091' if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+4360 if LPT == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}


if `c' == 2 {
gen double MIOHSHC = MIOHS*`o6020' if sex == 0
gen double STOHSHC = STOHS*`o6030' if sex == 0
gen double DMOHSHC = DMOHS*`o6010' if sex == 0
gen double MISHSHC = MISHS*`o6040' if sex == 0
gen double MIDHSHC = MIDHS*`o6050' if sex == 0
gen double STDHSHC = STDHS*`o6060' if sex == 0
gen double MSDHSHC = MSDHS*`o6070' if sex == 0
replace MIOHSHC = MIOHS*`o6021' if sex == 1
replace STOHSHC = STOHS*`o6031' if sex == 1
replace DMOHSHC = DMOHS*`o6011' if sex == 1
replace MISHSHC = MISHS*`o6041' if sex == 1
replace MIDHSHC = MIDHS*`o6051' if sex == 1
replace STDHSHC = STDHS*`o6061' if sex == 1
replace MSDHSHC = MSDHS*`o6071' if sex == 1
gen double ACMIC = `o6082' if MIE == 1 & DTE == .
replace ACMIC = 0.233*`o6082' if MIE == 1 & DTE == 1
gen double ACSTC = `o6092' if STE == 1 & DTE ==.
replace ACSTC = 0.841*`o6092' if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}



gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(`o705'*(1-WFP_GP))
gen STOHS_WFP = 1-(`o706'*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(`o706'*(1-WFP_GP))
gen MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(`o705'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(`o706'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-`o703')/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-`o703')/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-`o704')/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-`o703')/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-`o703'-`o704')/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-`o703'-`o704')/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-`o703'-`o704')/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-`o702')/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`o702')/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-`o702')/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`o701')/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-`o702')/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-`o702')/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-`o702')/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-`o702')/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-`o701')/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-`o702')/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.


if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}

gen N = 1 if cycle == 0
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MIE STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 38
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save OSA/tabressp_`i'_`osa'_`rf'_`c', replace
}
}
}
}
}
texdoc stlog close


/***
\color{black}

\clearpage
\section{Probabilistic sensitivity analyses}


Disribution parameters are calculated as follows.
For beta distributions, 
\begin{quote}
\begin{math} 
\alpha = \mu^2 (\frac{1-\mu}{\sigma^2}-\frac{1}{\mu})
\end{math}
\end{quote}
and
\begin{quote}
\begin{math} 
\beta = \alpha (\frac{1}{\mu}-1)
\end{math}
\end{quote}
So for the utility values with a beta distribution, the chronic utilities for diabetes, MI, and stroke, 
the alpha and beta values are calculated, respectively, as:
\begin{quote}
\begin{math} 
\alpha_{DM} = 0.785^2 (\frac{1-0.785}{(\frac{0.889-0.681}{3.92})^2}-\frac{1}{0.785}) = 46.3 \\
 \\
\alpha_{MI} = 0.79^2 (\frac{1-0.79}{(\frac{0.85-0.73}{3.92})^2}-\frac{1}{0.79}) =  139.1 \\
 \\
\alpha_{ST} = 0.65^2 (\frac{1-0.65}{(\frac{0.67-0.63}{3.92})^2}-\frac{1}{0.65}) = 1419.5 \\
 \\
\beta_{DM} = 46.27 (\frac{1}{0.785}-1) = 12.7 \\
 \\
\beta_{MI} = 139.07 (\frac{1}{0.79}-1) = 37.0 \\
 \\
\beta_{ST} = 1419.54 (\frac{1}{0.65}-1) = 764.4 \\
\end{math}
\end{quote}

For gamma distributions, 
\begin{quote}
\begin{math} 
k = \frac{\mu^2}{\sigma^2}
\end{math} \\
\\
\begin{math} 
\theta = \frac{\sigma^2}{\mu}
\end{math}
\end{quote}

For the costs with a gamma distribution, the chronic costs of diabetes, MI, and/or stroke,
and acute costs of MI and stroke, the \begin{math} k \end{math} and \begin{math} \theta \end{math} values
are calculated, for Australia then the UK, respectively, as:
\begin{quote}
Australia: \\
\begin{math} 
k_{CDMA} = \frac{3588^2}{(\frac{4539-2816}{3.92})^2} = 66.6 \\
 \\
k_{CMIA} = \frac{6222^2}{(\frac{1.1 \times 6222 - 0.9 \times 6222}{3.92})^2} = 384.2 \\
 \\
k_{CSTA} = \frac{4388^2}{(\frac{1.1 \times 4388 - 0.9 \times 4388}{3.92})^2} = 384.2 \\
 \\
k_{CDCA} = \frac{8870^2}{(\frac{10937-6804}{3.92})^2} = 70.8 \\
 \\
k_{AMIA} = \frac{14434^2}{(\frac{1.1 \times 14434 - 0.9 \times 14434}{3.92})^2} = 384.2 \\
 \\
k_{ASTA} = \frac{15659^2}{(\frac{1.1 \times 15659 - 0.9 \times 15659}{3.92})^2} = 384.2 \\
 \\
\theta_{CDMA} = \frac{(\frac{4539-2816}{3.92})^2}{3588} = 53.8 \\
 \\
\theta_{CMIA} = \frac{(\frac{1.1 \times 6222 - 0.9 \times 6222}{3.92})^2}{6222} = 16.2 \\
 \\
\theta_{CSTA} = \frac{(\frac{1.1 \times 4388 - 0.9 \times 4388}{3.92})^2}{4388} = 11.4 \\
 \\
\theta_{CDCA} = \frac{(\frac{10937-6804}{3.92})^2}{9112} = 125.3 \\
 \\
\theta_{AMIA} = \frac{(\frac{1.1 \times 14434 - 0.9 \times 14434}{3.92})^2}{14434} = 37.6 \\
 \\
\theta_{ASTA} = \frac{(\frac{1.1 \times 15659 - 0.9 \times 15659}{3.92})^2}{15659} = 40.8 \\
 \\
\end{math}
UK: \\
\begin{math} 
k_{CDMUF} = \frac{2546^2}{(\frac{2633-2462}{3.92})^2} = 3406 \\
 \\
k_{CDMUM} = \frac{2170^2}{(\frac{2254-2090}{3.92})^2} = 2690 \\
 \\
k_{CMIUF} = \frac{3304^2}{(\frac{3607-3026}{3.92})^2} = 496.9 \\
 \\
k_{CMIUM} = \frac{2917^2}{(\frac{3149-2701}{3.92})^2} = 651.5 \\
 \\
k_{CSTUF} = \frac{7021^2}{(\frac{8421-5852}{3.92})^2} = 114.8 \\
 \\
k_{CSTUM} = \frac{7351^2}{(\frac{8062-5923}{3.92})^2} = 181.5 \\
 \\
k_{CMSUF} = \frac{14442^2}{(\frac{21004-9929}{3.92})^2} = 26.1 \\
 \\
k_{CMSUM} = \frac{12616^2}{(\frac{18756-8484}{3.92})^2} = 23.2 \\
 \\
k_{CMDUF} = \frac{4511^2}{(\frac{5155-3947}{3.92})^2} = 214.3 \\
 \\
k_{CMDUM} = \frac{3917^2}{(\frac{4409-3480}{3.92})^2} = 273.2 \\
 \\
k_{CSDUF} = \frac{10014^2}{(\frac{13167-7615}{3.92})^2} = 50.0 \\
 \\
k_{CSDUM} = \frac{10494^2}{(\frac{14300-7701}{3.92})^2} = 38.9 \\
 \\
k_{AMIU} = \frac{2212^2}{(\frac{1.1 \times 2212 - 0.9 \times 2212}{3.92})^2} = 384.2 \\
 \\
k_{ASTU} = \frac{4626^2}{(\frac{1.1 \times 4626 - 0.9 \times 4626}{3.92})^2} = 384.2 \\
 \\
\theta_{CDMUF} = \frac{(\frac{2633-2462}{3.92})^2}{2546} = 0.75 \\
 \\
\theta_{CDMUM} = \frac{(\frac{2254-2090}{3.92})^2}{2170} = 0.81 \\
 \\
\theta_{CMIUF} = \frac{(\frac{3607-3026}{3.92})^2}{3304} = 6.65 \\
 \\
\theta_{CMIUM} = \frac{(\frac{3149-2701}{3.92})^2}{2917} = 4.48 \\
 \\
\theta_{CSTUF} = \frac{(\frac{8421-5852}{3.92})^2}{7021} = 61.2 \\
 \\
\theta_{CSTUM} = \frac{(\frac{8062-5923}{3.92})^2}{7351} = 40.5 \\
 \\
\theta_{CMSUF} = \frac{(\frac{21004-9929}{3.92})^2}{14442} = 552.7 \\
 \\
\theta_{CMSUM} = \frac{(\frac{18756-8484}{3.92})^2}{12616} = 544.3 \\
 \\
\theta_{CMDUF} = \frac{(\frac{5155-3947}{3.92})^2}{4511} = 21.1 \\
 \\
\theta_{CMDUM} = \frac{(\frac{4409-3480}{3.92})^2}{3917} = 14.3 \\
 \\
\theta_{CSDUF} = \frac{(\frac{13167-7615}{3.92})^2}{10014} = 200.3 \\
 \\
\theta_{CSDUM} = \frac{(\frac{14300-7701}{3.92})^2}{10494} = 270.0 \\
 \\
\theta_{AMIU} = \frac{(\frac{1.1 \times 2212 - 0.9 \times 2212}{3.92})^2}{2212} = 5.8 \\
 \\
\theta_{ASTU} = \frac{(\frac{1.1 \times 4626 - 0.9 \times 4626}{3.92})^2}{4626} = 12.0 \\
 \\
\end{math}
\end{quote}

\subsection{Study 1}


\color{Blue4}
***/

**PICKUP: write PSA code and execute. 

texdoc stlog, cmdlog nodo
*mkdir PSA
quietly {
forval psa = 1/500 {
if `psa' == 1 {
set seed 174697
}
if `psa' == 51 {
set seed 42384
}
if `psa' == 101 {
set seed 923887
}
if `psa' == 151 {
set seed 7660735
}
if `psa' == 201 {
set seed 525303
}
if `psa' == 251 {
set seed 25007
}
if `psa' == 301 {
set seed 15824
}
if `psa' == 351 {
set seed 1606670
}
if `psa' == 401 {
set seed 174697
}
if `psa' == 451 {
set seed 3284454
}
noisily di `psa'
foreach p in 0 ///
101 102 103 104 105 106 107 108 ///
109 110 111 112 113 114 115 116 ///
117 118 119 120 121 122 123 124 ///
125 126 127 128 129 130 131 132 ///
133 134 ///
201 202 203 204 205 ///
301 302 303 304 305 306 307 308 ///
309 310 311 312 313 314 315 316 ///
317 318 319 320 321 322 323 324 ///
401 402 ///
501 502 503 504 505 506 507 508 ///
509 510 ///
601 602 603 604 605 606 607 608 ///
609 /// 
701 702 703 704 705 706 {
local p`p' = rnormal()
}
local ll = 0.517+(`p401'*((0.522-0.512)/3.92))
local sl = 20+(`p402'*((25-15)/3.92))
local p502 = rbeta(46.3,12.7)
local p503 = rbeta(139.1,37.0)
local p504 = rbeta(1419.5,764.4)
local p505 = rbeta(1419.5,764.4)
local p506 = -0.055 + `p506'*((0.067-0.042)/3.92)
local p507 = -0.164 + `p507'*((0.222-0.105)/3.92)
local p508 = -0.164 + `p508'*((0.222-0.105)/3.92)
local p509 = -0.01125 + `p509'*(((0.01125*1.1)-(0.01125*0.9))/3.92)
local p510 = -0.03 + `p510'*(((0.03*1.1)-(0.03*0.9))/3.92)
local p601 = rgamma(66.6,53.8)
local p602 = rgamma(384.2,16.2)
local p603 = rgamma(384.2,11.4)
local p604 = rgamma(384.2,16.2)
local p605 = rgamma(70.8,125.3)
local p606 = rgamma(70.8,125.3)
local p607 = rgamma(70.8,125.3)
local p6081 = rgamma(384.2,37.6)
local p6091 = rgamma(384.2,40.8)
local p6010 = rgamma(3406,0.75)
local p6011 = rgamma(2690,0.81)
local p6020 = rgamma(496.9,6.65)
local p6021 = rgamma(651.5,4.48)
local p6030 = rgamma(114.8,61.2)
local p6031 = rgamma(181.5,40.5)
local p6040 = rgamma(26.1,552.7)
local p6041 = rgamma(23.2,544.3)
local p6050 = rgamma(214.3,21.1)
local p6051 = rgamma(273.2,14.3)
local p6060 = rgamma(50.0,200.3)
local p6061 = rgamma(38.9,270.0)
local p6070 = rgamma(26.1,552.7)
local p6071 = rgamma(23.2,544.3)
local p6082 = rgamma(384.2,5.8)
local p6092 = rgamma(384.2,12.0)
local p701 = 55+(`p701'*(((55*1.2)-(55*0.8))/3.92))
local p702 = 90+(`p702'*(((90*1.2)-(90*0.8))/3.92))
local p703 = 21.5+(`p703'*(((21.5*1.2)-(21.5*0.8))/3.92))
local p704 = 6+(`p704'*((10-2)/3.92))
local p705 = exp(ln(1.46)+(`p705'*((ln(1.55)-ln(1.36))/3.92)))
local p706 = exp(ln(1.92)+(`p706'*((ln(2.06)-ln(1.80))/3.92)))
use modstart, clear
replace rand = runiform()
save PSA/modstart_psa_`psa', replace
forval m = 0/1 {
use PSA/modstart_psa_`psa', clear
forval c = 0/44 {
if `c' == 0 | `c' == 5 | `c' == 10 | `c' == 15 | `c' == 20 ///
| `c' == 25 |  `c' == 30 | `c' == 35 | `c' == 40 {
gen tyr = 100*(1-0.9776^(exp( ///
(0.4648*((age-60)/5)) + ///
(0.7744*cs) + ///
(0.3131*((sbp-120)/20)) + ///
(0.1002*(ldl+hdl+0.5-6)) + ///
(-0.2606*((hdl-1.3)/0.5)) + ///
(-0.1088*(cs*(age-60)/5)) + ///
(-0.0277*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0226*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0613*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 0
replace tyr = 100*(1-0.9605^(exp( ///
(0.3742*((age-60)/5)) + ///
(0.6012*cs) + ///
(0.2777*((sbp-120)/20)) + ///
(0.1458*(ldl+hdl+0.5-6)) + ///
(-0.2698*((hdl-1.3)/0.5)) + ///
(-0.0755*(cs*(age-60)/5)) + ///
(-0.0255*(((sbp-120)/20)*((age-60)/5))) + ///
(-0.0281*((ldl+hdl+0.5-6)*((age-60)/5))) + ///
(0.0426*(((hdl-1.3)/0.5)*((age-60)/5))) ///
))) if cycle == `c' & sex == 1
if `m' == 0 {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-`ll') if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-`sl' if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
if `c' == 0 {
gen LPAT=.
}
}
if `m' == 1 {
if `c' == 0 {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70)
gen LPAT=1 if vhr!=1 & cycle == `c'
replace vhr = 1 if lpa >= 90 & cycle == `c'
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | (tyr >=7.5 & age <50) | (tyr >= 10 & inrange(age,50,69)) | age >= 70 | lpa >= 90) & MI == 0 & ST == 0
}
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-`ll') if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-`sl' if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
}
else {
gen vhr = 1 if cycle == `c' & (DM == 1 | age >= 70) & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & vhr == 1 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & vhr == 1 & sbp >= 140 & DT!=1 & MI == 0 & ST == 0
replace LLT = 1 if cycle == `c' & ldl >= 5 & DT!=1 & MI == 0 & ST == 0
replace AHT = 1 if cycle == `c' & sbp >= 160 & DT!=1 & MI == 0 & ST == 0
bysort ind (age) : replace ldl = ldl*(1-`ll') if cycle == `c' & LLT == 1 & LLT[_n-1]!=1 & MI == 0 & ST == 0
bysort ind (age) : replace sbp = sbp-`sl' if cycle == `c' & AHT == 1 & AHT[_n-1]!=1 & MI == 0 & ST == 0
}
gen cumldl=.
gen mcldl=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen ldllog_`ii' = ldl*logf_`ii'
bysort ind (age) : gen cumldllog_`ii' = sum(ldllog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumldl = cumldllog_`ii' if age == `ii'
replace mcldl = cumldllog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumldl
gen cumlpa=.
gen mclpa=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-3)/3)^(-2) if age <= `ii'
gen lpalog_`ii' = lpa*logf_`ii'
bysort ind (age) : gen cumlpalog_`ii' = sum(lpalog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumlpa = cumlpalog_`ii' if age == `ii'
replace mclpa = cumlpalog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumlpa
gen cumsbp=.
gen mcsbp=.
forval ii = 0/84 {
gen logf_`ii' = ((age-`ii'-2.1)/2.1)^(-2) if age <= `ii'
gen sbplog_`ii' = sbp*logf_`ii'
bysort ind (age) : gen cumsbplog_`ii' = sum(sbplog_`ii')
bysort ind (age) : gen cumlog_`ii' = sum(logf_`ii')
replace cumsbp = cumsbplog_`ii' if age == `ii'
replace mcsbp = cumsbplog_`ii'/cumlog_`ii' if age == `ii'
}
drop logf_0-cumlog_84 cumsbp
replace mcldl = . if cycle!=`c'
replace mclpa = . if cycle!=`c'
replace mcsbp = . if cycle!=`c'
merge m:1 sex age using aveldl_cal, keep(1 3) nogen
gen errr = (aveldlub-aveldllb)/3.92
replace aveldl = aveldl+(`p201'*errr)
drop errr
merge m:1 sex age using avelpa_cal, keep(1 3) nogen
gen errr = (aveldlub-aveldllb)/3.92
replace avelpa = avelpa+(`p202'*errr)
drop errr
merge m:1 sex age using avesbp_cal, keep(1 3) nogen
gen errr = (aveldlub-aveldllb)/3.92
replace avesbp = avesbp+(`p203'*errr)
drop errr
merge m:1 sex age using DMmod, keep(1 3) nogen
replace DMP = exp(ln(DMP)+(`p204'*errr))
drop errr
merge m:1 sex age using LSImod, keep(1 3) nogen
replace LSI = exp(ln(LSI)+(`p205'*errr))
drop errr
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
merge m:1 age sex using INC/`i'
drop _merge
rename (rate errr) (rate_`i' errr_`i')
}
replace rate_nfMI = exp(ln(rate_nfMI)+(`p101'*errr_nfMI))
replace rate_fMI = exp(ln(rate_fMI)+(`p102'*errr_fMI))
replace rate_nfIS = exp(ln(rate_nfIS)+(`p103'*errr_nfIS))
replace rate_fIS = exp(ln(rate_fIS)+(`p104'*errr_fIS))
replace rate_nfICH = exp(ln(rate_nfICH)+(`p105'*errr_nfICH))
replace rate_fICH = exp(ln(rate_fICH)+(`p106'*errr_fICH))
replace rate_blacdeath = exp(ln(rate_blacdeath)+(`p107'*errr_blacdeath))
replace rate_colcdeath = exp(ln(rate_colcdeath)+(`p108'*errr_colcdeath))
replace rate_oescdeath = exp(ln(rate_oescdeath)+(`p109'*errr_oescdeath))
replace rate_kidcdeath = exp(ln(rate_kidcdeath)+(`p110'*errr_kidcdeath))
replace rate_luncdeath = exp(ln(rate_luncdeath)+(`p111'*errr_luncdeath))
replace rate_ovacdeath = exp(ln(rate_ovacdeath)+(`p112'*errr_ovacdeath))
replace rate_pancdeath = exp(ln(rate_pancdeath)+(`p113'*errr_pancdeath))
replace rate_pneudeath = exp(ln(rate_pneudeath)+(`p114'*errr_pneudeath))
replace rate_copddeath = exp(ln(rate_copddeath)+(`p115'*errr_copddeath))
replace rate_alsdeath = exp(ln(rate_alsdeath)+(`p116'*errr_alsdeath))
replace rate_pddeath = exp(ln(rate_pddeath)+(`p117'*errr_pddeath))
replace rate_otherdeath = exp(ln(rate_otherdeath)+(`p118'*errr_otherdeath))
replace rate_t2d = exp(ln(rate_t2d)+(`p134'*errr_t2d))
replace rate_t2d = 0 if DM == 1
foreach i in t2d oescdeath colcdeath pancdeath luncdeath ovacdeath kidcdeath ///
blacdeath pneudeath copddeath alsdeath pddeath otherdeath ///
fMI nfMI fIS nfIS fICH nfICH {
drop  errr_`i'
}
recast double rate_t2d-rate_nfICH
replace rate_t2d = rate_t2d*((exp(ln(1.21)+(`p312'*((ln(1.03)-ln(1.41))/3.92))))^(lsi-LSI))
foreach i in nf f {
replace rate_`i'MI=rate_`i'MI*((exp(ln(2.083)+(`p301'*((ln(2.222)-ln(2.000))/3.92))))^(mcldl-aveldl))
replace rate_`i'MI=rate_`i'MI*((exp(ln(1.0054)+(`p302'*((ln(1.0045)-ln(1.0062))/3.92))))^(mclpa-avelpa))
replace rate_`i'MI=rate_`i'MI*((exp(ln(1.058)+(`p303'*((ln(1.051)-ln(1.064))/3.92))))^(mcsbp-avesbp))
replace rate_`i'MI=rate_`i'MI*((exp(ln(1.43)+(`p304'*((ln(1.22)-ln(1.62))/3.92))))^(lsi-LSI))
replace rate_`i'MI=rate_`i'MI/(1+(((exp(ln(1.26)+(`p305'*((ln(1.40)-ln(1.08))/3.92))))-1)*DMP)) if DM == 0
replace rate_`i'MI=(exp(ln(1.26)+(`p305'*((ln(1.40)-ln(1.08))/3.92))))*rate_`i'MI/(1+(((exp(ln(1.26)+(`p305'*((ln(1.40)-ln(1.08))/3.92))))-1)*DMP)) if DM == 1
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.08)+(`p306'*((ln(1.03)-ln(1.14))/3.92))))^(mcldl-aveldl))
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.0035)+(`p307'*((ln(1.0023)-ln(1.0045))/3.92))))^(mclpa-avelpa))
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.027)+(`p308'*((ln(1.018)-ln(1.037))/3.92))))^(mcsbp-avesbp))
replace rate_`i'IS=rate_`i'IS*((exp(ln(1.33)+(`p309'*((ln(1.22)-ln(1.46))/3.92))))^(lsi-LSI))
replace rate_`i'IS=rate_`i'IS/(1+(((exp(ln(1.74)+(`p310'*((ln(2.47)-ln(1.19))/3.92))))-1)*DMP)) if DM == 0
replace rate_`i'IS=(exp(ln(1.74)+(`p310'*((ln(2.47)-ln(1.19))/3.92))))*rate_`i'IS/(1+(((exp(ln(1.74)+(`p310'*((ln(2.47)-ln(1.19))/3.92))))-1)*DMP)) if DM == 1
replace rate_`i'ICH=rate_`i'ICH*((exp(ln(1.039)+(`p311'*((ln(1.010)-ln(1.069))/3.92))))^(mcsbp-avesbp))
}
replace rate_blacdeath = rate_blacdeath*((exp(ln(2.52)+(`p313'*((ln(1.66)-ln(3.81))/3.92))))^(lsi-LSI))
replace rate_colcdeath = rate_colcdeath*((exp(ln(1.24)+(`p314'*((ln(1.06)-ln(1.44))/3.92))))^(lsi-LSI))
replace rate_oescdeath = rate_oescdeath*((exp(ln(3.67)+(`p315'*((ln(1.67)-ln(8.02))/3.92))))^(lsi-LSI))
replace rate_kidcdeath = rate_kidcdeath*((exp(ln(1.69)+(`p316'*((ln(1.04)-ln(3.05))/3.92))))^(lsi-LSI))
replace rate_luncdeath = rate_luncdeath*((exp(ln(13.64)+(`p317'*((ln(8.85)-ln(21.03))/3.92))))^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_luncdeath = rate_luncdeath*((exp(ln(13.64)+(`p317'*((ln(8.85)-ln(21.03))/3.92))))^(0.692*2)) if lsi-LSI > 0.694*2
replace rate_ovacdeath = rate_ovacdeath*((exp(ln(1.27)+(`p318'*((ln(1.04)-ln(1.57))/3.92))))^(lsi-LSI))
replace rate_pancdeath = rate_pancdeath*((exp(ln(2.13)+(`p319'*((ln(1.15)-ln(3.90))/3.92))))^(lsi-LSI))
replace rate_pneudeath = rate_pneudeath*((exp(ln(1.016)+(`p320'*((ln(1.008)-ln(1.025))/3.92))))^(mcsbp-avesbp))
replace rate_pneudeath = rate_pneudeath*((exp(ln(4.03)+(`p321'*((ln(3.16)-ln(5.11))/3.92))))^(lsi-LSI))
replace rate_copddeath = rate_copddeath*((exp(ln(13.64)+(`p322'*((ln(8.85)-ln(21.03))/3.92))))^(lsi-LSI)) if lsi-LSI <= 0.694*2
replace rate_copddeath = rate_copddeath*((exp(ln(13.64)+(`p322'*((ln(8.85)-ln(21.03))/3.92))))^(0.692*2)) if lsi-LSI > 0.694*2
replace rate_alsdeath = rate_alsdeath*((exp(ln(1.09)+(`p323'*((ln(1.03)-ln(1.14))/3.92))))^(mcldl-aveldl))
replace rate_pddeath = rate_pddeath*((exp(ln(0.48)+(`p324'*((ln(0.27)-ln(1.01))/3.92))))^(lsi-LSI))
recode rate_ovacdeath .=0
merge m:1 sex MI ST age using pevtpe, keep(1 3) nogen
replace ratenfMI = exp(ln(ratenfMI)+(`p119'*errrnfMI)) if MI == 1 & ST == 0
replace ratefMI = exp(ln(ratefMI)+(`p120'*errrfMI)) if MI == 1 & ST == 0
replace ratenfS = exp(ln(ratenfS)+(`p121'*errrnfS)) if MI == 1 & ST == 0
replace ratefS = exp(ln(ratefS)+(`p122'*errrfS)) if MI == 1 & ST == 0
replace rateothd = exp(ln(rateothd)+(`p123'*errrothd)) if MI == 1 & ST == 0
replace ratenfMI = exp(ln(ratenfMI)+(`p124'*errrnfMI)) if MI == 0 & ST == 1
replace ratefMI = exp(ln(ratefMI)+(`p125'*errrfMI)) if MI == 0 & ST == 1
replace ratenfS = exp(ln(ratenfS)+(`p126'*errrnfS)) if MI == 0 & ST == 1
replace ratefS = exp(ln(ratefS)+(`p127'*errrfS)) if MI == 0 & ST == 1
replace rateothd = exp(ln(rateothd)+(`p128'*errrothd)) if MI == 0 & ST == 1
replace ratenfMI = exp(ln(ratenfMI)+(`p129'*errrnfMI)) if MI == 1 & ST == 1
replace ratefMI = exp(ln(ratefMI)+(`p130'*errrfMI)) if MI == 1 & ST == 1
replace ratenfS = exp(ln(ratenfS)+(`p131'*errrnfS)) if MI == 1 & ST == 1
replace ratefS = exp(ln(ratefS)+(`p132'*errrfS)) if MI == 1 & ST == 1
replace rateothd = exp(ln(rateothd)+(`p133'*errrothd)) if MI == 1 & ST == 1
drop errrfMI-errrothd
sort ind age
gen ratesum0 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace ratesum0 = ratesum0+`var' if MI == 0 & ST == 0
}
gen tpsum0 = 1-exp(-ratesum0)
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = tpsum0*`var'/ratesum0 if MI == 0 & ST == 0
}
gen ratesum1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace ratesum1 = ratesum1+`var' if MI == 1 | ST == 1
}
gen tpsum1 = 1-exp(-ratesum1)
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = tpsum1*`var'/ratesum1 if MI == 1 | ST == 1
}
local var1 = 0
foreach var of varlist rate_t2d-rate_nfICH {
replace `var' = `var'+`var1' if MI == 0 & ST == 0
local var1 = "`var'"
}
local var1 = 0
foreach var of varlist rate_t2d ratefMI-rateothd {
replace `var' = `var'+`var1' if MI == 1 | ST == 1
local var1 = "`var'"
}
replace rand = . if DT == 1
replace DME=1 if inrange(rand,0,rate_t2d) & DM == 0 & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,ratefMI) | inrange(rand,ratenfMI,ratefS) | inrange(rand,ratenfS,rateothd)) & (MI == 1 | ST == 1) & cycle == `c'
replace MIE=1 if inrange(rand,rate_t2d,ratenfMI) & (MI == 1 | ST == 1) & cycle == `c'
replace STE=1 if inrange(rand,ratenfMI,ratenfS) & (MI == 1 | ST == 1) & cycle == `c'
replace DTE=1 if (inrange(rand,rate_t2d,rate_fMI) | inrange(rand,rate_nfMI,rate_fIS) | inrange(rand,rate_nfIS,rate_fICH)) & MI==0 & ST == 0 & cycle == `c'
replace MIE=1 if inrange(rand,rate_otherdeath,rate_nfMI) & MI== 0 & ST == 0 & cycle == `c'
replace STE=1 if inrange(rand,rate_nfMI,rate_nfICH) & MI== 0 & ST == 0 & cycle == `c'
bysort ind (age) : replace DT = max(DT[_n-1],DTE[_n-1]) if cycle[_n-1]==`c'
foreach var of varlist DM MI ST {
bysort ind (age) : replace `var' = max(`var'[_n-1],`var'E[_n-1]) if cycle[_n-1]==`c'
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
bysort ind (age) : replace ldl = ldl[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace lpa = lpa[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace sbp = sbp[_n-1]+0.91 if cycle[_n-1]==`c' & sex == 0
bysort ind (age) : replace sbp = sbp[_n-1]+0.56 if cycle[_n-1]==`c' & sex == 1
bysort ind (age) : replace LLT = LLT[_n-1] if cycle[_n-1]==`c'
bysort ind (age) : replace AHT = AHT[_n-1] if cycle[_n-1]==`c'
foreach var of varlist hdl-lsi LLT AHT {
bysort ind (age) : replace `var' = . if cycle[_n-1]==`c' & (DTE[_n-1]==1 | DT[_n-1]==1)
}
keep ind-rand LPAT
}
save PSA/modend`m'_`psa', replace
}
forval c = 1/2 {
forval i = 0/1 {
use PSA/modend`i'_`psa', clear
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
sort ind age
gen LPATT=1 if LPAT==1 & lpa >= 90
keep if cycle!=.

if `c' == 1 {
merge m:1 sex age using UTvals_AU, keep(3) nogen
replace UT = invlogit(xb+`p501'*errr)
drop xb errr UTlb UTub
}
if `c' == 2 {
merge m:1 sex age using UTvals_UK, keep(3) nogen
replace UT = UT+(UT*0.0255*`p501')
replace UT = 0 if UT < 0
replace UT = 1 if UT > 1
}


sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*`p503'
gen double STOHSQL = STOHS*UT*`p504'
gen double DMOHSQL = DMOHS*UT*`p502'
gen double MISHSQL = MISHS*UT*`p505'
gen double MIDHSQL = MIDHS*UT*(`p502'+`p506')
gen double STDHSQL = STDHS*UT*(`p502'+`p507')
gen double MSDHSQL = MSDHS*UT*(`p502'+`p508')
replace MIOHSQL = MIOHSQL+`p509' if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL+`p509' if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL+`p509' if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL+`p509' if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL+`p510' if STE == 1 & DTE==.
replace MISHSQL = MISHSQL+`p510' if STE == 1 & DTE==.
replace STDHSQL = STDHSQL+`p510' if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL+`p510' if STE == 1 & DTE==.


if `c' == 1 {
gen double MIOHSHC = MIOHS*`p602'
gen double STOHSHC = STOHS*`p603'
gen double DMOHSHC = DMOHS*`p601'
gen double MISHSHC = MISHS*`p604'
gen double MIDHSHC = MIDHS*`p605'
gen double STDHSHC = STDHS*`p606'
gen double MSDHSHC = MSDHS*`p607'
gen double ACMIC = `p6081' if MIE == 1 & DTE == .
replace ACMIC = 0.233*`p6081' if MIE == 1 & DTE == 1
gen double ACSTC = `p6091' if STE == 1 & DTE ==.
replace ACSTC = 0.841*`p6091' if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+200 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+200+143+212 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 25 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.801 if sex == 0 & inrange(age,40,44)
replace WFP_GP = 0.801 if sex == 0 & inrange(age,45,54)
replace WFP_GP = 0.622 if sex == 0 & inrange(age,55,66)
replace WFP_GP = 0.890 if sex == 1 & inrange(age,40,44)
replace WFP_GP = 0.865 if sex == 1 & inrange(age,45,54)
replace WFP_GP = 0.725 if sex == 1 & inrange(age,55,66)
}

if `c' == 2 {
gen double MIOHSHC = MIOHS*`p6020' if sex == 0
gen double STOHSHC = STOHS*`p6030' if sex == 0
gen double DMOHSHC = DMOHS*`p6010' if sex == 0
gen double MISHSHC = MISHS*`p6040' if sex == 0
gen double MIDHSHC = MIDHS*`p6050' if sex == 0
gen double STDHSHC = STDHS*`p6060' if sex == 0
gen double MSDHSHC = MSDHS*`p6070' if sex == 0
replace MIOHSHC = MIOHS*`p6021' if sex == 1
replace STOHSHC = STOHS*`p6031' if sex == 1
replace DMOHSHC = DMOHS*`p6011' if sex == 1
replace MISHSHC = MISHS*`p6041' if sex == 1
replace MIDHSHC = MIDHS*`p6051' if sex == 1
replace STDHSHC = STDHS*`p6061' if sex == 1
replace MSDHSHC = MSDHS*`p6071' if sex == 1
gen double ACMIC = `p6082' if MIE == 1 & DTE == .
replace ACMIC = 0.233*`p6082' if MIE == 1 & DTE == 1
gen double ACSTC = `p6092' if STE == 1 & DTE ==.
replace ACSTC = 0.841*`p6092' if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
}



gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(`p705'*(1-WFP_GP))
gen STOHS_WFP = 1-(`p706'*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(`p706'*(1-WFP_GP))
gen MIDHS_WFP = 1-(`p705'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(`p705'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(`p705'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(`p705'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(`p706'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(`p706'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(`p706'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(`p706'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(`p706'*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(`p706'*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(`p706'*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(`p706'*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-`p703')/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-`p703')/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-`p704')/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-`p703')/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-`p703'-`p704')/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-`p703'-`p704')/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-`p703'-`p704')/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-`p701')/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-`p702')/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`p701')/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`p702')/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-`p701')/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-`p702')/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-`p701')/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-`p702')/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-`p701')/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-`p702')/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-`p701')/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-`p702')/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-`p701')/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-`p702')/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-`p701')/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-`p702')/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.



if `c' == 1 {
gen WFP = 0 if age < 67
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*73003
gen DC = 1/((1.05)^(cycle))
}
if `c' == 2 {
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
}



gen N = 1 if cycle == 0
foreach var of varlist HEAHS-LPATHC INDC {
gen double `var'_DC = `var'*DC
}
collapse (sum) N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC INDC_DC
gen double YLL = HEAHS_DC+MIOHS_DC+STOHS_DC+DMOHS_DC+MISHS_DC+MIDHS_DC+STDHS_DC+MSDHS_DC
gen double QLY = HEAHSQL_DC+MIOHSQL_DC+STOHSQL_DC+DMOHSQL_DC+MISHSQL_DC+MIDHSQL_DC+STDHSQL_DC+MSDHSQL_DC
gen double HCC = MIOHSHC_DC+STOHSHC_DC+DMOHSHC_DC+MISHSHC_DC+MIDHSHC_DC+STDHSHC_DC+MSDHSHC_DC+ACMIC_DC+ACSTC_DC+DRUGSHC_DC+LPATHC_DC
gen double TSC = HCC+INDC_DC
order N LPAT LPATT MI1 MIE ST1 STE DTE HEAHS_DC-LPATHC_DC YLL QLY HCC INDC TSC
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist N-TSC {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
gen i = `i'
gen psa = `psa'
gen c = `c'
save PSA/tabres_`i'_`psa'_`c', replace
}

}
erase PSA/modstart_psa_`psa'.dta
forval m = 0/1 {
erase PSA/modend`m'_`psa'.dta
}
}
}
clear
forval c = 1/2 {
forval psa = 1/500 {
use PSA/tabres_0_`psa'_`c', clear
merge 1:1 _n using PSA/tabres_1_`psa'_`c', nogen
gen double diff = val1-val0
expand 3 if stat=="TSC"
replace stat = "ICER" if _n == 41
replace stat = "SICER" if _n == 42
replace val0 = . if _n>40
replace val1 = . if _n>40
replace diff = diff[38]/diff[37] if _n==41
replace diff = diff[40]/diff[37] if _n==42
drop i
gen njm = _n
save PSA/tabres_`psa'_`c', replace
}
}
clear
forval c = 1/2 {
forval psa = 1/500 {
append using PSA/tabres_`psa'_`c'
}
}
save PSA/Res, replace
forval c = 1/2 {
use PSA/Res, clear
keep if c == `c'
mat A = (.,.,.,.)
mat B = (.,.,.,.)
mat C = (.,.,.,.)
forval i = 1/42 {
centile val0 if njm == `i', centile(50 2.5 97.5)
mat A = (A\0`i',r(c_1),r(c_2),r(c_3))
centile val1 if njm == `i', centile(50 2.5 97.5)
mat B = (B\0`i',r(c_1),r(c_2),r(c_3))
centile diff if njm == `i', centile(50 2.5 97.5)
mat C = (C\0`i',r(c_1),r(c_2),r(c_3))
}
mat A = A[2..43,1..4]
mat B = B[2..43,1..4]
mat C = C[2..43,1..4]

keep if _n <= 42
svmat double A
svmat double B
svmat double C
drop val0-diff
tostring A1-C4, force format(%15.0fc) replace
gen A = A2 + " (" + A3 + ", " + A4 + ")"
gen B = B2 + " (" + B3 + ", " + B4 + ")"
gen C = C2 + " (" + C3 + ", " + C4 + ")"
gen row = ""
replace row = "Population size" if _n == 1
replace row = "Lp(a) tests" if _n == 2
replace row = "Treatment modified in response to Lp(a) test" if _n == 3
replace row = "Incident MI (N)" if _n == 4
replace row = "Total MIs (N)" if _n == 5
replace row = "Incident stroke (N)" if _n == 6
replace row = "Total strokes (N)" if _n == 7
replace row = "Deaths (N)" if _n == 8
replace row = "YLL no CVD or diabetes" if _n == 9
replace row = "YLL with MI" if _n == 10
replace row = "YLL with stroke" if _n == 11
replace row = "YLL with diabetes" if _n == 12
replace row = "YLL with MI and stroke" if _n == 13
replace row = "YLL with MI and diabetes" if _n == 14
replace row = "YLL with stroke and diabetes" if _n == 15
replace row = "YLL with MI, stroke, and diabetes" if _n == 16
replace row = "QALY with no CVD or diabetes" if _n == 17
replace row = "QALY with MI" if _n == 18
replace row = "QALY with stroke" if _n == 19
replace row = "QALY with diabetes" if _n == 20
replace row = "QALY with MI and stroke" if _n == 21
replace row = "QALY with MI and diabetes" if _n == 22
replace row = "QALY with stroke and diabetes" if _n == 23
replace row = "QALY with MI, stroke, and diabetes" if _n == 24
replace row = "Chronic MI healthcare costs (\textsterling)" if _n == 25
replace row = "Chronic stroke healthcare costs (\textsterling)" if _n == 26
replace row = "Chronic diabetes healthcare costs (\textsterling)" if _n == 27
replace row = "Chronic MI and stroke healthcare costs (\textsterling)" if _n == 28
replace row = "Chronic MI and diabetes healthcare costs (\textsterling)" if _n == 29
replace row = "Chronic stroke and diabetes healthcare costs (\textsterling)" if _n == 30
replace row = "Chronic MI, diabetes, and stroke healthcare costs (\textsterling)" if _n == 31
replace row = "Acute MI costs (\textsterling)" if _n == 32
replace row = "Acute stroke costs (\textsterling)" if _n == 33
replace row = "Medication costs (\textsterling)" if _n == 34
replace row = "Lp(a) test costs (\textsterling)" if _n == 35
replace row = "Total YLL" if _n == 36
replace row = "Total QALY" if _n == 37
replace row = "Total healthcare costs (\textsterling)" if _n == 38
replace row = "Total indirect costs (\textsterling)" if _n == 39
replace row = "Total costs (\textsterling)" if _n == 40
replace row = "ICER (\textsterling \ per QALY)" if _n == 41
replace row = "SICER (\textsterling \ per QALY)" if _n == 42
if `c' == 1 {
replace row = subinstr(row,"\textsterling","\\$",.)
}
keep row A B C
order row A B C
replace A = "" if A == ". (., .)"
replace B = "" if B == ". (., .)"
export delimited using CSV/PSArestab_`c'.csv, delimiter(":") novarnames replace
drop if inrange(_n,9,31)
save tempsumtabpsa_`c', replace
}
clear
append using tempsumtabpsa_1 tempsumtabpsa_2
drop if inrange(_n,20,27)
gen CC = "Overall" if _n == 1
replace CC = "Australia" if _n == 9
replace CC = "UK" if _n == 20
order CC
export delimited using CSV/PSArestabsumpaper.csv, delimiter(":") novarnames replace
use PSA/Res, clear
keep if njm ==38 | njm == 37
bysort c psa (njm) : gen double diff1 = diff[_n+1]
rename (diff diff1) (qly hcc)
drop if njm == 38
keep psa c qly hcc
replace hcc = hcc/1000000
forval c = 1/2 {
if `c' == 1 {
local cc = "Australia"
local wtp = 28000
local cur = "AUD"
local rr = 54
}
else {
local cc = "UK"
local wtp = 20000
local cur = "GBP"
local rr = 75
}
twoway ///
(scatter hcc qly if c == `c', msize(vsmall) col(magenta)) ///
(function y = x*`wtp'/1000000, ra(0 `rr') col(dknavy)) ///
, graphregion(color(white)) ///
legend(off) ///
ytitle("Incremental costs (`cur', millions)") xtitle("Incremental QALYs") ///
xline(0, lcol(gs12)) yline(0, lcol(gs12)) xscale(range(0 200)) yscale(range(-1 1.5)) ///
ylabel(-2(0.5)1.5, angle(0) format(%9.1fc) nogrid) xlabel(0(50)200, format(%9.0f)) ///
title("`cc', healthcare perspective", col(black) size(medium) placement(west))
graph save GPH/PSA_`c', replace
}
use PSA/Res, clear
keep if njm ==40 | njm == 37
bysort c psa (njm) : gen double diff1 = diff[_n+1]
rename (diff diff1) (qly hcc)
drop if njm == 40
keep psa c qly hcc
replace hcc = hcc/1000000
forval c = 1/2 {
if `c' == 1 {
local cc = "Australia"
local wtp = 28000
local cur = "AUD"
local rr = 54
}
else {
local cc = "UK"
local wtp = 20000
local cur = "GBP"
local rr = 75
}
twoway ///
(scatter hcc qly if c == `c', msize(vsmall) col(magenta)) ///
(function y = x*`wtp'/1000000, ra(0 `rr') col(dknavy)) ///
, graphregion(color(white)) ///
legend(off) ///
ytitle("Incremental costs (`cur', millions)") xtitle("Incremental QALYs") ///
xline(0, lcol(gs12)) yline(0, lcol(gs12)) xscale(range(0 200)) yscale(range(-1 1.5)) ///
ylabel(-3(0.5)1.5, angle(0) format(%9.1fc) nogrid) xlabel(0(50)200, format(%9.0f)) ///
title("`cc', societal perspective", col(black) size(medium) placement(west))
graph save GPH/PSAS_`c', replace
}
texdoc stlog close

/***
\color{black}

\clearpage
\subsubsection{Results}
\begin{landscape}
\begin{table}[h!]
  \begin{center}
    \caption{Probabilistic sensitivity analysis results for Lp(a) testing (intervention) compared to standard of care (control). Australia.}
    \label{PSAtabfa}
     \fontsize{7pt}{9pt}\selectfont\pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/PSArestab_1.csv}
  \end{center}
Abbreviations: 
MI -- Myocardial infarction;
YLL -- Years of life lived;
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}


\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Probabilistic sensitivity analysis results for Lp(a) testing (intervention) compared to standard of care (control). The UK.}
    \label{PSAtabfu}
     \fontsize{7pt}{9pt}\selectfont\pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/PSArestab_2.csv}
  \end{center}
Abbreviations: 
MI -- Myocardial infarction;
YLL -- Years of life lived;
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}
\end{landscape}

\color{Blue4}
***/

texdoc stlog, cmdlog
graph combine ///
GPH/PSA_1.gph ///
GPH/PSA_2.gph ///
GPH/PSAS_1.gph ///
GPH/PSAS_2.gph ///
, graphregion(color(white)) cols(2) xsize(5) altshrink
texdoc graph, label(psafig) figure(h!) fontface("Liberation Sans") ///
caption(Results of the probabilistic sensitivity analysis for Lp(a) testing (intervention) compared to standard of care (control) ///
in a common cost-effectiveness plane for each country.)
texdoc stlog close
texdoc stlog
use PSA/Res, clear
keep if njm == 41
count if c == 1 & diff < 28000
count if c == 1 & diff < 0
count if c == 2 & diff < 20000
count if c == 2 & diff < 0
use PSA/Res, clear
keep if njm == 42
count if c == 1 & diff < 28000
count if c == 1 & diff < 0
count if c == 2 & diff < 20000
count if c == 2 & diff < 0
texdoc stlog close

/***
\color{black}

\clearpage
\section{Cost adaptation}

We will perform cost adaptation based on the approach of Ademi et al. \cite{AdemiCA2018} 
to present results for the following countries (in addition to Australia and the UK):
\begin{itemize}
\item Austria
\item France
\item Germany
\item Italy
\item The Netherlands
\item Spain
\item Poland
\item the United States of America (USA). 
\end{itemize}

To do this, I will need the per-capita expenditure on healthcare for each country,
the purchasing power parity for each country, and the mean annual income for each country. 
These data will be sourced from the Organization for Economic Cooperation and Development (OECD)
\cite{OECDHS,OECDPPP,OECDAAW}. 
I will use these data to adjust costs with the UK serving as the reference. 
The willingness-to-pay threshold for comparison will be drawn from a study estimating
cost-effectiveness thresholds for 174 countries by Pichon-Riviere et al. \cite{PRLGH2023},
which gave the following estimated cost-effectiveness thresholds per QALY in 2019 USD:
\begin{itemize}
\item Austria -- \$46,380
\item Canada -- \$44,638
\item France -- \$40,006
\item Germany -- \$47,461
\item Italy -- \$46,357
\item The Netherlands -- \$47,122
\item Spain -- \$24,733
\item Poland -- \$8,389
\item the United States of America (USA) -- \$95,958.
\end{itemize}

\begin{table}[h!]
\centering
    \caption{Health spending, purchasing power parity (PPP) ratio, and average annual wages
for selected OECD countries (all data in 2022 USD).}
    \label{}
	\begin{tabular}{llll}
\hline
Country & Health spending & PPP & Average annual wages \\
\hline
Austria & 7,275 & 0.70 & 71,340 \\
Canada & 6,319 & 1.16 & 66,066 \\
France & 6,630 & 0.67 & 60,086 \\
Germany & 8,011 & 0.69 & 65,822 \\
Italy & 4,291 & 0.60 & 50,263 \\
The Netherlands & 6,729 & 0.73 & 71,776 \\
Spain & 4,432 & 0.58 & 50,859 \\
Poland & 2,973 & 1.79 & 40,023 \\
UK & 5,493 & 0.65 & 57,323 \\
USA & 12,555 & 1.00 & 79,882 \\
\hline
\end{tabular}
\end{table}

\clearpage
\subsection{Study 1}

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
quietly {
forval i = 0/1 {
use modend`i', clear
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
sort ind age
gen LPATT=1 if LPAT==1 & lpa >= 90
keep if cycle!=.
merge m:1 sex age using UTvals_UK, keep(3) nogen
sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.
gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)
gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
gen N = 1 if cycle == 0

forval c = 1/10 {
if `c' == 1 { 
local CC = "UK"
local HS = 5493
local PP = 0.65
local AW = 57323
}
if `c' == 2 { 
local CC = "Austria"
local HS = 7275
local PP = 0.70
local AW = 71340
}
if `c' == 3 { 
local CC = "Canada"
local HS = 6319
local PP = 1.16
local AW = 66066
}
if `c' == 4 { 
local CC = "France"
local HS = 6630
local PP = 0.67
local AW = 60086
}
if `c' == 5 { 
local CC = "Germany"
local HS = 8011
local PP = 0.69
local AW = 65822
}
if `c' == 6 { 
local CC = "Italy"
local HS = 4291
local PP = 0.60
local AW = 50263
}
if `c' == 7 { 
local CC = "The Netherlands"
local HS = 6729
local PP = 0.73
local AW = 71776
}
if `c' == 8 { 
local CC = "Spain"
local HS = 4432
local PP = 0.58
local AW = 50859
}
if `c' == 9 { 
local CC = "Poland"
local HS = 2973
local PP = 1.79
local AW = 40023
}
if `c' == 10 { 
local CC = "USA"
local HS = 12555
local PP = 1
local AW = 79882
}
foreach var of varlist HEAHS-MSDHSQL {
gen double `var'_DC_`c' = `var'*DC
}

foreach var of varlist MIOHSHC-LPATHC {
gen double `var'_DC_`c' = `var'*DC*(`HS'/5493)*(`PP'/0.65)
}
gen double INDC_DC_`c' = INDC*DC*(`HS'/5493)*(`PP'/0.65)*(`AW'/57323)
}
collapse (sum) N HEAHS_DC_1-INDC_DC_10
forval c = 1/10 {
gen double QLY_`c' = HEAHSQL_DC_`c'+MIOHSQL_DC_`c'+STOHSQL_DC_`c'+DMOHSQL_DC_`c'+MISHSQL_DC_`c'+MIDHSQL_DC_`c'+STDHSQL_DC_`c'+MSDHSQL_DC_`c'
gen double HCC_`c' = MIOHSHC_DC_`c'+STOHSHC_DC_`c'+DMOHSHC_DC_`c'+MISHSHC_DC_`c'+MIDHSHC_DC_`c'+STDHSHC_DC_`c'+MSDHSHC_DC_`c'+ACMIC_DC_`c'+ACSTC_DC_`c'+DRUGSHC_DC_`c'+LPATHC_DC_`c'
gen double IND_`c' = INDC_DC_`c'
gen double TSC_`c' = HCC_`c'+INDC_DC_`c'
}
keep QLY_1-TSC_10
expand 40
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist QLY_1-TSC_10 {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save tabres_`i'_CA, replace
}
}
use tabres_0_CA, clear
merge 1:1 _n using tabres_1_CA, nogen
gen double diff = val1-val0
gen njm = _n
gen country = substr(stat,-1,1)
replace country = "10" if country == "0"
destring country, replace
expand 3 if substr(stat,1,3)=="TSC"
gen njmm = _n
bysort country (njm njmm) : replace val0 = . if _n>=5
bysort country (njm njmm) : replace val1 = . if _n>=5
bysort country (njm njmm) : replace diff = diff[2]/diff[1] if _n==5
bysort country (njm njmm) : replace diff = diff[4]/diff[1] if _n==6
bysort country (njm njmm) : drop if _n == 1
gen row = ""
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 Euro)" if _n == 1
bysort country (njm njmm) : replace row = "Total indirect costs (2023 Euro)" if _n == 2
bysort country (njm njmm) : replace row = "Total costs (2023 Euro)" if _n == 3
bysort country (njm njmm) : replace row = "ICER (2023 Euro per QALY)" if _n == 4
bysort country (njm njmm) : replace row = "SICER (2023 Euro per QALY)" if _n == 5
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 GBP)" if _n == 1 & country == 1
bysort country (njm njmm) : replace row = "Total indirect costs (2023 GBP)" if _n == 2 & country == 1
bysort country (njm njmm) : replace row = "Total costs (2023 GBP)" if _n == 3 & country == 1
bysort country (njm njmm) : replace row = "ICER (2023 GBP per QALY)" if _n == 4 & country == 1
bysort country (njm njmm) : replace row = "SICER (2023 GBP per QALY)" if _n == 5 & country == 1
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 CAD)" if _n == 1 & country == 3
bysort country (njm njmm) : replace row = "Total indirect costs (2023 CAD)" if _n == 2 & country == 3
bysort country (njm njmm) : replace row = "Total costs (2023 CAD)" if _n == 3 & country == 3
bysort country (njm njmm) : replace row = "ICER (2023 CAD per QALY)" if _n == 4 & country == 3
bysort country (njm njmm) : replace row = "SICER (2023 CAD per QALY)" if _n == 5 & country == 3
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 Zloty)" if _n == 1 & country == 9
bysort country (njm njmm) : replace row = "Total indirect costs (2023 Zloty)" if _n == 2 & country == 9
bysort country (njm njmm) : replace row = "Total costs (2023 Zloty)" if _n == 3 & country == 9
bysort country (njm njmm) : replace row = "ICER (2023 Zloty per QALY)" if _n == 4 & country == 9
bysort country (njm njmm) : replace row = "SICER (2023 Zloty per QALY)" if _n == 5 & country == 9
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 USD)" if _n == 1 & country == 10
bysort country (njm njmm) : replace row = "Total indirect costs (2023 USD)" if _n == 2 & country == 10
bysort country (njm njmm) : replace row = "Total costs (2023 USD)" if _n == 3 & country == 10
bysort country (njm njmm) : replace row = "ICER (2023 USD per QALY)" if _n == 4 & country == 10
bysort country (njm njmm) : replace row = "SICER (2023 USD per QALY)" if _n == 5 & country == 10
gen C = ""
bysort country (njm njmm) : replace C = "UK" if _n == 1 & country == 1
bysort country (njm njmm) : replace C = "Austria" if _n == 1 & country == 2
bysort country (njm njmm) : replace C = "Canada" if _n == 1 & country == 3
bysort country (njm njmm) : replace C = "France" if _n == 1 & country == 4
bysort country (njm njmm) : replace C = "Germany" if _n == 1 & country == 5
bysort country (njm njmm) : replace C = "Italy" if _n == 1 & country == 6
bysort country (njm njmm) : replace C = "The Netherlands" if _n == 1 & country == 7
bysort country (njm njmm) : replace C = "Spain" if _n == 1 & country == 8
bysort country (njm njmm) : replace C = "Poland" if _n == 1 & country == 9
bysort country (njm njmm) : replace C = "USA" if _n == 1 & country == 10
order C row val0 val1 diff
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
drop stat-njmm
drop if _n <= 5
export delimited using CSV/CAres.csv, delimiter(":") novarnames replace
texdoc stlog close

/***
\color{black}

\clearpage
\thispagestyle{empty}
\begin{table}[h!]
  \begin{center}
	\vspace*{-1cm}
    \caption{Cost adaptation results. Study 1.}
    \label{CAres}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
        every nth row={5}{before row=\midrule},
    ]{CSV/CAres.csv}
  \end{center}
Abbreviations: 
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}



\clearpage
\subsection{Study 2}

\color{Blue4}
***/

texdoc stlog, cmdlog nodo
quietly {
forval ii = 0/1 {
use modend2_`ii', clear
bysort ind MIE (age) : gen MI1 = 1 if _n == 1 & MIE == 1
bysort ind STE (age) : gen ST1 = 1 if _n == 1 & STE == 1
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.
merge m:1 sex age using UTvals_UK, keep(3) nogen
sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.

gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+18.00 if LLT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC+15.91+12.42+9.91 if AHT == 1 & MI == 0 & ST == 0
replace DRUGSHC = DRUGSHC/2 if MIE == 1 | STE == 1 | DTE == 1
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)

gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
gen N = 1 if cycle == 0


forval c = 1/9 {
if `c' == 1 { 
local CC = "UK"
local HS = 5493
local PP = 0.65
local AW = 57323
}
if `c' == 2 { 
local CC = "Austria"
local HS = 7275
local PP = 0.70
local AW = 71340
}
if `c' == 3 { 
local CC = "France"
local HS = 6630
local PP = 0.67
local AW = 60086
}
if `c' == 4 { 
local CC = "Germany"
local HS = 8011
local PP = 0.69
local AW = 65822
}
if `c' == 5 { 
local CC = "Italy"
local HS = 4291
local PP = 0.60
local AW = 50263
}
if `c' == 6 { 
local CC = "The Netherlands"
local HS = 6729
local PP = 0.73
local AW = 71776
}
if `c' == 7 { 
local CC = "Spain"
local HS = 4432
local PP = 0.58
local AW = 50859
}
if `c' == 8 { 
local CC = "Poland"
local HS = 2973
local PP = 1.79
local AW = 40023
}
if `c' == 9 { 
local CC = "USA"
local HS = 12555
local PP = 1
local AW = 79882
}
foreach var of varlist HEAHS-MSDHSQL {
gen double `var'_DC_`c' = `var'*DC
}

foreach var of varlist MIOHSHC-LPATHC {
gen double `var'_DC_`c' = `var'*DC*(`HS'/5493)*(`PP'/0.65)
}
gen double INDC_DC_`c' = INDC*DC*(`HS'/5493)*(`PP'/0.65)*(`AW'/57323)
}
collapse (sum) N HEAHS_DC_1-INDC_DC_9
forval c = 1/9 {
gen double QLY_`c' = HEAHSQL_DC_`c'+MIOHSQL_DC_`c'+STOHSQL_DC_`c'+DMOHSQL_DC_`c'+MISHSQL_DC_`c'+MIDHSQL_DC_`c'+STDHSQL_DC_`c'+MSDHSQL_DC_`c'
gen double HCC_`c' = MIOHSHC_DC_`c'+STOHSHC_DC_`c'+DMOHSHC_DC_`c'+MISHSHC_DC_`c'+MIDHSHC_DC_`c'+STDHSHC_DC_`c'+MSDHSHC_DC_`c'+ACMIC_DC_`c'+ACSTC_DC_`c'+DRUGSHC_DC_`c'+LPATHC_DC_`c'
gen double IND_`c' = INDC_DC_`c'
gen double TSC_`c' = HCC_`c'+INDC_DC_`c'
}
keep QLY_1-TSC_9
expand 32
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist QLY_1-TSC_9 {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`ii'
save tabres_`ii'_CA_2, replace
}
}
use tabres_0_CA_2, clear
merge 1:1 _n using tabres_1_CA_2, nogen
gen double diff = val1-val0
gen njm = _n
gen country = substr(stat,-1,1)
expand 3 if substr(stat,1,3)=="TSC"
gen njmm = _n
bysort country (njm njmm) : replace val0 = . if _n>=5
bysort country (njm njmm) : replace val1 = . if _n>=5
bysort country (njm njmm) : replace diff = diff[2]/diff[1] if _n==5
bysort country (njm njmm) : replace diff = diff[4]/diff[1] if _n==6
bysort country (njm njmm) : drop if _n == 1
gen row = ""
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 Euro)" if _n == 1
bysort country (njm njmm) : replace row = "Total indirect costs (2023 Euro)" if _n == 2
bysort country (njm njmm) : replace row = "Total costs (2023 Euro)" if _n == 3
bysort country (njm njmm) : replace row = "ICER (2023 Euro per QALY)" if _n == 4
bysort country (njm njmm) : replace row = "SICER (2023 Euro per QALY)" if _n == 5
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 GBP)" if _n == 1 & country == "1"
bysort country (njm njmm) : replace row = "Total indirect costs (2023 GBP)" if _n == 2 & country == "1"
bysort country (njm njmm) : replace row = "ICER (2023 GBP per QALY)" if _n == 4 & country == "1"
bysort country (njm njmm) : replace row = "SICER (2023 GBP per QALY)" if _n == 5 & country == "1"
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 Zloty)" if _n == 1 & country == "8"
bysort country (njm njmm) : replace row = "Total indirect costs (2023 Zloty)" if _n == 2 & country == "8"
bysort country (njm njmm) : replace row = "Total costs (2023 Zloty)" if _n == 3 & country == "8"
bysort country (njm njmm) : replace row = "ICER (2023 Zloty per QALY)" if _n == 4 & country == "8"
bysort country (njm njmm) : replace row = "SICER (2023 Zloty per QALY)" if _n == 5 & country == "8"
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 USD)" if _n == 1 & country == "9"
bysort country (njm njmm) : replace row = "Total indirect costs (2023 USD)" if _n == 2 & country == "9"
bysort country (njm njmm) : replace row = "Total costs (2023 USD)" if _n == 3 & country == "9"
bysort country (njm njmm) : replace row = "ICER (2023 USD per QALY)" if _n == 4 & country == "9"
bysort country (njm njmm) : replace row = "SICER (2023 USD per QALY)" if _n == 5 & country == "9"
gen C = ""
bysort country (njm njmm) : replace C = "UK" if _n == 1 & country == "1"
bysort country (njm njmm) : replace C = "Austria" if _n == 1 & country == "2"
bysort country (njm njmm) : replace C = "France" if _n == 1 & country == "3"
bysort country (njm njmm) : replace C = "Germany" if _n == 1 & country == "4"
bysort country (njm njmm) : replace C = "Italy" if _n == 1 & country == "5"
bysort country (njm njmm) : replace C = "The Netherlands" if _n == 1 & country == "6"
bysort country (njm njmm) : replace C = "Spain" if _n == 1 & country == "7"
bysort country (njm njmm) : replace C = "Poland" if _n == 1 & country == "8"
bysort country (njm njmm) : replace C = "USA" if _n == 1 & country == "9"
order C row val0 val1 diff
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
drop stat-njmm
export delimited using CSV/CAres2.csv, delimiter(":") novarnames replace


quietly {
forval i = 0/1 {
use modendsp`i', clear
bysort ind LPAT (age) : replace LPAT=. if _n!=1
gen LPATT=1 if LPAT==1 & LPT == 1
keep if cycle!=.
merge m:1 sex age using UTvals_UK, keep(3) nogen
sort ind age
gen double HEAHS = .
gen double MIOHS = .
gen double STOHS = .
gen double DMOHS = .
gen double MISHS = .
gen double MIDHS = .
gen double STDHS = .
gen double MSDHS = .
replace HEAHS = 1 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==. & STE==. & DME==. & DTE==.
replace HEAHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & (MIE==1 | STE==1 | DME==1 | DTE==1)
replace MIOHS = 1 if MI==1 & ST==0 & DM==0 & DT==0 & STE==. & DME==. & DTE==.
replace MIOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MIOHS = 0.5 if MI==1 & ST==0 & DM==0 & DT==0 & (STE==1 | DME==1 | DTE==1)
replace STOHS = 1 if MI==0 & ST==1 & DM==0 & DT==0 & MIE==. & DME==. & DTE==.
replace STOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace STOHS = 0.5 if MI==0 & ST==1 & DM==0 & DT==0 & (MIE==1 | DME==1 | DTE==1)
replace DMOHS = 1 if MI==0 & ST==0 & DM==1 & DT==0 & MIE==. & STE==. & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.
replace DMOHS = 0.5 if MI==0 & ST==0 & DM==1 & DT==0 & (MIE==1 | STE==1 | DTE==1)
replace MISHS = 1 if MI==1 & ST==1 & DM==0 & DT==0 & DME==. & DTE==.
replace MISHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.) | (MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.)
replace MISHS = 0.5 if MI==1 & ST==1 & DM==0 & DT==0 & (DME==1 | DTE==1)
replace MIDHS = 1 if MI==1 & ST==0 & DM==1 & DT==0 & STE==. & DTE==.
replace MIDHS = 0.5 if (MI==1 & ST==0 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MIDHS = 0.5 if MI==1 & ST==0 & DM==1 & DT==0 & (STE==1 | DTE==1)
replace STDHS = 1 if MI==0 & ST==1 & DM==1 & DT==0 & MIE==. & DTE==.
replace STDHS = 0.5 if (MI==0 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | (MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.)
replace STDHS = 0.5 if MI==0 & ST==1 & DM==1 & DT==0 & (MIE==1 | DTE==1)
replace MSDHS = 1 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==.
replace MSDHS = 0.5 if ///
(MI==1 & ST==1 & DM==0 & DT==0 & DME==1 & DTE==.) | ///
(MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.) | ///
(MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.)
replace MSDHS = 0.5 if MI==1 & ST==1 & DM==1 & DT==0 & DTE==1
gen double HEAHSQL = HEAHS*UT
gen double MIOHSQL = MIOHS*UT*0.79
gen double STOHSQL = STOHS*UT*0.65
gen double DMOHSQL = DMOHS*UT*0.785
gen double MISHSQL = MISHS*UT*0.65
gen double MIDHSQL = MIDHS*UT*(0.785-0.055)
gen double STDHSQL = STDHS*UT*(0.785-0.164)
gen double MSDHSQL = MSDHS*UT*(0.785-0.164)
replace MIOHSQL = MIOHSQL-0.01125 if MIE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.01125 if MIE == 1 & DTE==.
replace MIDHSQL = MIDHSQL-0.01125 if MIE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.01125 if MIE == 1 & DTE==.
replace STOHSQL = STOHSQL-0.03 if STE == 1 & DTE==.
replace MISHSQL = MISHSQL-0.03 if STE == 1 & DTE==.
replace STDHSQL = STDHSQL-0.03 if STE == 1 & DTE==.
replace MSDHSQL = MSDHSQL-0.03 if STE == 1 & DTE==.



gen double MIOHSHC = MIOHS*3304 if sex == 0
gen double STOHSHC = STOHS*7021 if sex == 0
gen double DMOHSHC = DMOHS*2546 if sex == 0
gen double MISHSHC =MISHS*14442 if sex == 0
gen double MIDHSHC = MIDHS*4511 if sex == 0
gen double STDHSHC = STDHS*10014 if sex == 0
gen double MSDHSHC =MSDHS*14442 if sex == 0
replace MIOHSHC = MIOHS*2917 if sex == 1
replace STOHSHC = STOHS*7351 if sex == 1
replace DMOHSHC = DMOHS*2170 if sex == 1
replace MISHSHC =MISHS*12616 if sex == 1
replace MIDHSHC = MIDHS*3917 if sex == 1
replace STDHSHC = STDHS*10494 if sex == 1
replace MSDHSHC =MSDHS*12616 if sex == 1
gen double ACMIC = 2212 if MIE == 1 & DTE == .
replace ACMIC = 515 if MIE == 1 & DTE == 1
gen double ACSTC = 4626 if STE == 1 & DTE ==.
replace ACSTC = 3886 if STE == 1 & DTE == 1
gen double DRUGSHC = 0
replace DRUGSHC = DRUGSHC+3975 if LPT == 1
gen LPATHC = 40 if LPAT==1
gen WFP_GP = .
replace WFP_GP = 0.806 if sex == 0 & inrange(age,40,49)
replace WFP_GP = 0.659 if sex == 0 & inrange(age,50,65)
replace WFP_GP = 0.900 if sex == 1 & inrange(age,40,49)
replace WFP_GP = 0.743 if sex == 1 & inrange(age,50,65)






gen HEAHS_WFP = WFP_GP
gen MIOHS_WFP = 1-(1.46*(1-WFP_GP))
gen STOHS_WFP = 1-(1.92*(1-WFP_GP))
gen DMOHS_WFP = WFP_GP-0.037 if  sex == 0 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.002 if sex == 0 & inrange(age,50,65)
replace DMOHS_WFP = WFP_GP-0.039 if sex == 1 & inrange(age,40,49)
replace DMOHS_WFP = WFP_GP-0.115 if sex == 1 & inrange(age,50,65)
gen MISHS_WFP = 1-(1.92*(1-WFP_GP))
gen MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MIDHS_WFP = 1-(1.46*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace STDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
gen MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.037 if sex == 0 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.002 if sex == 0 & inrange(age,50,65)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.039 if sex == 1 & inrange(age,40,49)
replace MSDHS_WFP = 1-(1.92*(1-WFP_GP))-0.115 if sex == 1 & inrange(age,50,65)
replace MIOHS_WFP= MIOHS_WFP*((365.25-21.5)/365.25)
replace STOHS_WFP= STOHS_WFP*((365.25-21.5)/365.25)
replace DMOHS_WFP= DMOHS_WFP*((365.25-6)/365.25)
replace MISHS_WFP= MISHS_WFP*((365.25-21.5)/365.25)
replace MIDHS_WFP= MIDHS_WFP*((365.25-21.5-6)/365.25)
replace STDHS_WFP= STDHS_WFP*((365.25-21.5-6)/365.25)
replace MSDHS_WFP= MSDHS_WFP*((365.25-21.5-6)/365.25)
replace MIOHS_WFP = MIOHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = STOHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((365.25-55)/365.25) if MI==1 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((365.25-90)/365.25) if MI==0 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MISHS_WFP*((365.25-55)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((365.25-90)/365.25) if MI==1 & ST==1 & DM==1 & DT==0 & STE==1 & DTE==.
replace MIOHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & MIE==1 & DTE==.
replace STOHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==0 & DT==0 & MIE==1 & DTE==.
replace MISHS_WFP = MIOHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==0 & DT==0 & STE==1 & DTE==.
replace MIDHS_WFP = MIDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & MIE==1 & DTE==.
replace STDHS_WFP = STDHS_WFP*((182.625-90)/182.625) if MI==0 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-55)/182.625) if MI==0 & ST==1 & DM==1 & DT==0 & MIE==1 & DTE==.
replace MSDHS_WFP = MSDHS_WFP*((182.625-90)/182.625) if MI==1 & ST==0 & DM==1 & DT==0 & STE==1 & DTE==.




gen WFP = 0 if age < 66
foreach var of varlist HEAHS-MSDHS {
replace WFP = WFP+(`var'*`var'_WFP) if `var'!=.
}
gen double INDC = (WFP_GP-WFP)*34855
gen DC = 1/((1.035)^(cycle))
gen N = 1 if cycle == 0

forval c = 1/9 {
if `c' == 1 { 
local CC = "UK"
local HS = 5493
local PP = 0.65
local AW = 57323
}
if `c' == 2 { 
local CC = "Austria"
local HS = 7275
local PP = 0.70
local AW = 71340
}
if `c' == 3 { 
local CC = "France"
local HS = 6630
local PP = 0.67
local AW = 60086
}
if `c' == 4 { 
local CC = "Germany"
local HS = 8011
local PP = 0.69
local AW = 65822
}
if `c' == 5 { 
local CC = "Italy"
local HS = 4291
local PP = 0.60
local AW = 50263
}
if `c' == 6 { 
local CC = "The Netherlands"
local HS = 6729
local PP = 0.73
local AW = 71776
}
if `c' == 7 { 
local CC = "Spain"
local HS = 4432
local PP = 0.58
local AW = 50859
}
if `c' == 8 { 
local CC = "Poland"
local HS = 2973
local PP = 1.79
local AW = 40023
}
if `c' == 9 { 
local CC = "USA"
local HS = 12555
local PP = 1
local AW = 79882
}
foreach var of varlist HEAHS-MSDHSQL {
gen double `var'_DC_`c' = `var'*DC
}

foreach var of varlist MIOHSHC-LPATHC {
gen double `var'_DC_`c' = `var'*DC*(`HS'/5493)*(`PP'/0.65)
}
gen double INDC_DC_`c' = INDC*DC*(`HS'/5493)*(`PP'/0.65)*(`AW'/57323)
}
collapse (sum) N HEAHS_DC_1-INDC_DC_9
forval c = 1/9 {
gen double QLY_`c' = HEAHSQL_DC_`c'+MIOHSQL_DC_`c'+STOHSQL_DC_`c'+DMOHSQL_DC_`c'+MISHSQL_DC_`c'+MIDHSQL_DC_`c'+STDHSQL_DC_`c'+MSDHSQL_DC_`c'
gen double HCC_`c' = MIOHSHC_DC_`c'+STOHSHC_DC_`c'+DMOHSHC_DC_`c'+MISHSHC_DC_`c'+MIDHSHC_DC_`c'+STDHSHC_DC_`c'+MSDHSHC_DC_`c'+ACMIC_DC_`c'+ACSTC_DC_`c'+DRUGSHC_DC_`c'+LPATHC_DC_`c'
gen double IND_`c' = INDC_DC_`c'
gen double TSC_`c' = HCC_`c'+INDC_DC_`c'
}
keep QLY_1-TSC_9
expand 32
gen stat = ""
gen double val =.
local j = 1
foreach var of varlist QLY_1-TSC_9 {
replace stat = "`var'" if _n == `j'
replace val = `var'[1] if _n == `j'
local j = `j'+1
}
keep stat val
rename val val`i'
save tabres_`i'_CA_2sp, replace
}
}
use tabres_0_CA_2sp, clear
merge 1:1 _n using tabres_1_CA_2sp, nogen
gen double diff = val1-val0
gen njm = _n
gen country = substr(stat,-1,1)
expand 3 if substr(stat,1,3)=="TSC"
gen njmm = _n
bysort country (njm njmm) : replace val0 = . if _n>=5
bysort country (njm njmm) : replace val1 = . if _n>=5
bysort country (njm njmm) : replace diff = diff[2]/diff[1] if _n==5
bysort country (njm njmm) : replace diff = diff[4]/diff[1] if _n==6
bysort country (njm njmm) : drop if _n == 1
gen row = ""
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 Euro)" if _n == 1
bysort country (njm njmm) : replace row = "Total indirect costs (2023 Euro)" if _n == 2
bysort country (njm njmm) : replace row = "Total costs (2023 Euro)" if _n == 3
bysort country (njm njmm) : replace row = "ICER (2023 Euro per QALY)" if _n == 4
bysort country (njm njmm) : replace row = "SICER (2023 Euro per QALY)" if _n == 5
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 GBP)" if _n == 1 & country == "1"
bysort country (njm njmm) : replace row = "Total indirect costs (2023 GBP)" if _n == 2 & country == "1"
bysort country (njm njmm) : replace row = "ICER (2023 GBP per QALY)" if _n == 4 & country == "1"
bysort country (njm njmm) : replace row = "SICER (2023 GBP per QALY)" if _n == 5 & country == "1"
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 Zloty)" if _n == 1 & country == "8"
bysort country (njm njmm) : replace row = "Total indirect costs (2023 Zloty)" if _n == 2 & country == "8"
bysort country (njm njmm) : replace row = "Total costs (2023 Zloty)" if _n == 3 & country == "8"
bysort country (njm njmm) : replace row = "ICER (2023 Zloty per QALY)" if _n == 4 & country == "8"
bysort country (njm njmm) : replace row = "SICER (2023 Zloty per QALY)" if _n == 5 & country == "8"
bysort country (njm njmm) : replace row = "Total healthcare costs (2023 USD)" if _n == 1 & country == "9"
bysort country (njm njmm) : replace row = "Total indirect costs (2023 USD)" if _n == 2 & country == "9"
bysort country (njm njmm) : replace row = "Total costs (2023 USD)" if _n == 3 & country == "9"
bysort country (njm njmm) : replace row = "ICER (2023 USD per QALY)" if _n == 4 & country == "9"
bysort country (njm njmm) : replace row = "SICER (2023 USD per QALY)" if _n == 5 & country == "9"
gen C = ""
bysort country (njm njmm) : replace C = "UK" if _n == 1 & country == "1"
bysort country (njm njmm) : replace C = "Austria" if _n == 1 & country == "2"
bysort country (njm njmm) : replace C = "France" if _n == 1 & country == "3"
bysort country (njm njmm) : replace C = "Germany" if _n == 1 & country == "4"
bysort country (njm njmm) : replace C = "Italy" if _n == 1 & country == "5"
bysort country (njm njmm) : replace C = "The Netherlands" if _n == 1 & country == "6"
bysort country (njm njmm) : replace C = "Spain" if _n == 1 & country == "7"
bysort country (njm njmm) : replace C = "Poland" if _n == 1 & country == "8"
bysort country (njm njmm) : replace C = "USA" if _n == 1 & country == "9"
order C row val0 val1 diff
tostring val0-diff, replace force format(%15.0fc)
replace val0 = "" if val0 == "."
replace val1 = "" if val1 == "."
drop stat-njmm
export delimited using CSV/CAres2sp.csv, delimiter(":") novarnames replace
texdoc stlog close

/***
\color{black}

\clearpage
\thispagestyle{empty}
\begin{table}[h!]
  \begin{center}
	\vspace*{-1cm}
    \caption{Cost adaptation results. Study 2. Primary prevention population.}
    \label{CArespp}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
        every nth row={5}{before row=\midrule},
    ]{CSV/CAres2.csv}
  \end{center}
Abbreviations: 
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}

\clearpage
\thispagestyle{empty}
\begin{table}[h!]
  \begin{center}
	\vspace*{-1cm}
    \caption{Cost adaptation results. Study 2. Secondary prevention population.}
    \label{CAressp}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
        every nth row={5}{before row=\midrule},
    ]{CSV/CAres2sp.csv}
  \end{center}
Abbreviations: 
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}


\clearpage
\section*{References}
\addcontentsline{toc}{section}{References}
\bibliography{Library/Library.bib}
\end{document}

***/

texdoc close

**# Bookmark #1


texdoc init LPA_MS1_A, replace logdir(LPA_MS1_A_dir) gropts(optargs(width=0.8\textwidth))
set linesize 100

/***
\documentclass[11pt]{article}
\usepackage{fullpage}
\usepackage{siunitx}
\usepackage{hyperref,graphicx,booktabs,dcolumn}
\usepackage{stata}
\usepackage[x11names]{xcolor}
\usepackage{natbib}
\usepackage{chngcntr}
\usepackage{pgfplotstable}
\usepackage{pdflscape}
\usepackage{amssymb}
\usepackage{multirow}
\usepackage{booktabs}
\usepackage[section]{placeins}

\newcommand{\specialcell}[2][c]{%
  \begin{tabular}[#1]{@{}l@{}}#2\end{tabular}}

\newcommand{\specialcelr}[2][c]{%
  \begin{tabular}[#1]{@{}r@{}}#2\end{tabular}}

\usepackage[superscript,biblabel]{cite}

\renewcommand{\figurename}{Supplementary Figure}
\renewcommand{\tablename}{Supplementary Table}

\newcommand{\thedate}{\today}

\bibliographystyle{unsrt}
\renewcommand{\bibsection}{}
\makeatletter
\renewcommand\@biblabel[1]{	#1.}
\makeatother

\begin{document}

\begin{titlepage}
    \begin{flushright}
        \Huge
        \textbf{
Lp(a) testing in European populations for the primary prevention of cardiovascular disease: a cost-effectiveness analysis
}
\rule{16cm}{2mm} \\
\Large
Appendix \\
\thedate \\
       \vfill
    \end{flushright}
        \Large


\noindent
Correspondence to: \\
Jedidiah Morton;  
\color{blue}
\href{mailto:Jedidiah.Morton@Monash.edu}{Jedidiah.Morton@monash.edu} \\ 
\color{black}
\noindent
Zanfina Ademi; 
\color{blue}
\href{mailto:Zanfina.Ademi@Monash.edu}{Zanfina.Ademi@monash.edu} \\ 
\color{black}

\end{titlepage}

\clearpage
\tableofcontents
\clearpage
\listoftables
\clearpage
\listoffigures

\clearpage
\section{Supplementary Methods}

\subsection{Estimation of transition probabilities}

Incident myocardial infarction (MI) was defined by the 
presence of the ICD-10 codes I21-I238, I241, or I252 as 
any diagnosis for an admission, or death without a prior
admission and an underlying cause of death as 
coronary heart disease (ICD-10 codes I21-I25). 
Repeat MI was defined by the presence of 
of the ICD-10 codes I21-I22 as the primary diagnosis for an admission
or death from CHD. 
Incident ischaemic stroke (IS) was defined by the 
presence of the ICD-10 codes I63-I64 as any diagnosis for an admission, 
or death without a prior admission and an underlying cause of death as 
IS (I63-I64). Repeat IS was defined by the presence of 
of the ICD-10 codes I63-I64 as the primary diagnosis for an admission
or death from IS. The ICD-10 code I64 -- ``uncertain stroke'' -- 
was included as an IS because IS
is the more common form of stroke \cite{GBDstroke2019}. 
Incident intracerebral hemorrhage (ICH) was defined by the 
presence of the ICD-10 code I61 as any diagnosis for an admission, 
or death without a prior admission and an underlying cause of death as 
ICH (I61). Repeat ICH was defined by the presence of 
of the ICD-10 code I61 as the primary diagnosis for an admission
or death from ICH.

Fatal events were defined when the date of death for an individual
was less than or equal to the end date of the stay in hospital
or the individual died without a hospital admission for the event. 
Non-fatal events were all other events. 

To estimate the incidence of first MI (fatal and non-fatal), 
first stroke (fatal and non-fatal), 
and mortality not due to coronary heart disease 
or stroke prior to the development of MI or stroke, 
we used age-period-cohort models \cite{CarstensenSTATMED2007}.
We tabulated follow-up data into 0.5-year intervals by age and date of follow-up, with
each unit containing the number of events and person-years of follow-up, and the value of age
and date of follow-up corresponding to the midpoint of the interval. A Poisson model
was then fit on this tabulated data. The outcome was the number of events in the interval,
the offset log-person-years, and predictors spline effects of age, year, and cohort (year minus age), 
with a log link function. Knot locations were as suggested by Harrel \cite{Harrell2001Springer}.
Models were fit separately for males and females. These models were then used to estimate the incidence of each outcome by age
in 1-year increments, with the prediction year set at 2016, which was roughly the mid-point of follow-up.
The incidence of outcomes prior to the development of MI or stroke is shown in Supplementary Figures~\ref{CVinc}-\ref{codmr}. 

We followed a similar approach to estimate the incidence of MI, stroke, 
and mortality not due to coronary heart disease 
or stroke following the development of MI or stroke. 
We tabulated data into 0.5-year intervals by age and prior CVD status (MI, stroke,
or both), with each unit containing the number of events and person-years of follow-up, and the value of age
corresponding to the midpoint of the interval. 
A Poisson model was then fit on this tabulated data. The outcome was the number of events in the interval,
the offset log-person-years, and predictors spline effects of age and factor effects of prior MI and/or stroke,
with a log link function. Knot locations were as suggested by Harrel \cite{Harrell2001Springer}.
Models were fit separately for males and females. These models were then used to estimate the 
incidence of each outcome by age in 1-year increments.
The incidence of outcomes following the development of MI or stroke is shown in Supplementary Figure~\ref{CVincpev}. 

Because the UK Biobank does not contain reliable data on the incidence of diabetes, 
we derived the age and sex-specific incidence of diabetes from Pal et al. \cite{PalBMJODRC2021},
as this study contained the most recent diabetes incidence data. We estimated
the incidence of type 2 diabetes using a combination of data from Pal et al. (the numerator) 
and the UK Office of National Statistics (the denominator) \cite{ONSPOP2013}.
We used a Poisson model with incident diabetes cases as the outcome,
(log) person-years of follow-up as the exposure, and included a spline effect of age,
fit separately by sex, with a log link function. We used this model to
estimate the age and sex-specific incidence of type 2 diabetes in 1-year increments. 
The incidence of type 2 diabetes is shown in Supplementary Figure~\ref{t2dincgph}.

\subsection{Risk factor trajectories}

Data on risk factor trajectories were also mostly informed by data from the UK Biobank. 
The effect of risk factors on the incidence of outcomes was incorporated via the following equation:
\begin{quote}
\begin{math}
R_a = R \times M^{x-\mu}
\end{math}
\end{quote}
where 
\begin{math} R_a \end{math} is the risk factor-adjusted age and sex-specific rate of CVD,  
\begin{math} R \end{math} is the age- and sex-specific rate of CVD for the whole population 
(i.e., the transition probabilities described above), 
\begin{math} M \end{math} is the measure of association from a Mendelian Randomisation study, 
\begin{math} x \end{math} is the time-weighted (time-weighting is described in the protocol) 
mean cumulative level of the risk factor (or LSI) for the individual in the simulation, and 
\begin{math} \mu \end{math} is the time-weighted mean cumulative level of the risk factor 
(or LSI) across the population used to derive the age- and sex- specific rate for the whole population.  

Therefore, we simulated two risk factor trajectories: \begin{math} x \end{math} and \begin{math} \mu \end{math}.
The values of \begin{math} \mu \end{math} for LDL-C, SBP, Lp(a), the LSI, and diabetes prevalence
for people aged 40-69 were derived directly from the UK Biobank baseline sample using generalised linear models,
and values from ages 70-84 years were projected using the same models. 

Prior to age 40 years, assumptions about LDL-C, Lp(a), and SBP trajectories were informed by the literature
(the model didn't require simulation of the LSI or diabetes prevalence prior to age 40 years). 
For LDL-C, LDL-C at birth was assumed to be 0.75 mmol/L \cite{DescampsAth2004}, before
increasing to 2 mmol/L by age 5 years \cite{KitJAMA2012}, and then increasing
linearly to the mean value of LDL-C in UK Biobank at age 40 years. 
Lp(a) was assumed to be constant from birth until age 40 
years \cite{WangPed1992,RifaiAth1992,McNealJCL2015}.
For SBP, we assumed it was 85 mmHg at age 1 year and increased 
linearly to 118mmHg at age 17 \cite{FourthHBP},
then increased linearly to age 40 years \cite{JiJAMA2020}. 

The values of \begin{math} x \end{math} (the time-weighted mean cumulative level of the risk factor 
(or LSI) for the individual in the simulation) followed similar assumptions but were simulated
for each individual included in the model. However, we made the following additional assumptions
to tailor trajectories to an individual: LDL-C is constant from age 40 years onwards in people 
who don't take lipid lowering therapy \cite{DuncanJAHA2019}; 
where an individual sits on the LDL-C distribution is constant throughout life; 
people receiving lipid lowering therapy at baseline initiated therapy 5 years 
before their date of first assessment \cite{TothLHD2019,TalicCDT2021,OforiJOG2017};
Prior to the model time horizon, lipid lowering therapy lowered LDL-C by 
30\% \cite{FangLHD2021,BacquerEJPC2020}; 
SBP increases linearly at the mean rate for the UK Biobank after the model starts;
people receiving anti-hypertensive therapy at baseline initiated therapy 10 years 
before their date of first assessment; one, two, and three antihypertensive drugs 
lead to SBP reductions before the model time horizon of 6.7 mmHg, 13.3 mmHg, and 19.9 mmHg, 
respectively \cite{LawBMJ2003}; smokers do not quit and non-smokers do not start smoking; and
HDL-C remains constant over the lifetime. 

Notably, we imputed Lp(a) values for a subset of the sample with missing Lp(a) -- 
the UK Biobank does not contain Lp(a) values for people with an Lp(a) of 189.1 nmol/L (88.5 mg/dL) and above (approximately
7\% of the population), and we were unable to obtain the return 
in which these have been calculated. 
Nevertheless, we have previously shown this imputation is accurate and likely inconsequential \cite{MortonVIH2024}
for the purposes of our modelling approach. 

\subsection{Pharmacological interventions}

We selected the high intensity statin in this study to be atorvastatin 80 mg once daily, as it is
one of the most used statins across high income countries \cite{TalicCDT2022,MatSPJ2023,RochatAJC2023}. 
We set the reduction in LDL-C associated with
atorvastatin at 51.7\% (51.2, 52.2) \cite{AdamsCDSR2015}, derived 
from a Cochrane systematic review and meta-analysis of randomised clinical trials. 

Pharmacological therapy for lowering SBP was based on the SPRINT trial \cite{SPRINT2015},
because it is the main trial cited when recommending pharmacological SBP 
lowering in the European guidelines \cite{VisserenEHJ2021}.
In the intensive SBP control arm of the SPRINT trial, patients ended up taking
a mean of 2.8 medications to achieve an approximately 20 mmHg reduction in SBP. 
We based the intervention on the most common medications used in the intensive arm --
losartan 100 mg, chlortalidone 25 mg, and amlodipine 10 mg, and assumed they led to a 
20 mmHg ($\pm$25\%) reduction in SBP. 


\subsection{Utility inputs}

The utility for people without diabetes or CVD in Australia was derived from 
a cross-sectional study of the Australian general population by McCaffrey et al \cite{McCaffreyHQLO2016},
from which we used beta regression to obtain age and sex-specific utilities in 1-year increments (Supplementary Figure~\ref{AgeUT}). 
The utility for people without diabetes or CVD in the UK was derived from a study using the Health Survey for England \cite{ARAVIH2010},
and was set via the equation: 
\begin{math} 0.9454933 + 0.0256466 \times male - 0.0002213 \times age - 0.0000294 \times age^2 \end{math} (Supplementary Figure~\ref{AgeUTUK}).
Chronic utilities for diabetes, MI, or stroke were derived from systematic 
reviews \cite{BeaudetVIH2014,BettsHQLO2020,JoundiJAHA2022}. 
These were set at 0.785 (95\%CI: 0.681, 0.889), 0.79 (0.73, 0.85), and 0.65 (0.63, 0.67), respectively,
and were applied multiplicatively to the age and sex-specific values for people without diabetes and CVD. 
Chronic disutilities for diabetes and MI and/or stroke were set at 
$-$0.055 ($-$0.067, $-$0.042) for diabetes and MI and $-$0.164 ($-$0.222, $-$0.105) 
for diabetes and stroke (and diabetes and MI and stroke). These values were derived
from the same systematic review and applied 
additively to the diabetes utility before multiplication by 
the age and sex-specific values for people without diabetes and CVD. 

Acute disutility values for MI and stroke were also applied. 
For MI, this was set at $-$0.01125 ($\pm$20\%) for one model cycle (equivalent to
the $-$0.045 disutility reported over 3 months in the study it was derived from) \cite{LaceyEJCN2004}.
For stroke, the disutility was set at $-$0.03 ($\pm$20\%) for one model cycle (again, equivalent
to the $-$0.12 disutility reported over 3 months in the study it was derived from) \cite{JoundiJAHA2022}.
These were applied additively to the utility estimate after accounting for age and sex.

\subsection{Cost inputs}

All costs in the primary analysis were in 2023 Australian dollars (\$, hereafter) and 
Great British pounds (\textsterling, hereafter), 
inflated (when necessary) using the Health Price Index \cite{AUSHPI23} and NHS cost inflation index \cite{NHSinflation2023}, for Australia and the UK, respectively. 

For Australia, acute and chronic costs for events and health states, respectively, 
were derived from cohort studies \cite{MortonDLOGIA2023,LeeDRCP2013,MarquinaEJPC2022,CobiacBMCPH2012,MortonVIH2024}.
The once-off cost of an Lp(a) test was set at \$25. All medication costs were derived from the Pharmaceutical
Benefits Scheme and set at
\$200 annually for atorvastatin 80 mg,
\$200 annually for losartan 100 mg,
\$143 annually for chlortalidone 25 mg, and
\$212 annually for amlodipine 10 mg \cite{PBSDOS23}.

For the UK, chronic costs for all health states were derived from a study by Public Health England \cite{PHEcosts2020}.
The acute costs of MI and stroke were derived from the UK National Health Service Cost Schedule in 2021/22 \cite{NHSCOST202122}. 
Fatal MIs were assumed to result in hospitalisation 23\% of the time and fatal strokes 84\% of the time \cite{MortonVIH2024}, 
with acute costs adjusted accordingly. 
The once-off test cost of an Lp(a) test was set at \textsterling 40.
All medication costs were derived from the NHS drug tariff
and set at 
\textsterling 18.00 annually for atorvastatin 80 mg,
\textsterling 15.91 annually for losartan 100 mg,
\textsterling 12.42 annually for chlortalidone 25 mg, and
\textsterling 9.91 annually for amlodipine 10 mg \cite{NHSDrugTariff062023}.

Indirect costs were estimated using the human capital approach \cite{VanARD2010}
We included costs due to lost earnings due to absenteeism, workforce dropout due to
diabetes or CVD, and loss of future earnings due to death before retirement (67 in Australia and 66 years in the UK). 
Indirect costs were calculated by multiplying lost work time (determined 
using age and sex-specific employment rates \cite{ABSEmployment,ONSEmployment}) by the average annual salary (\$73,003 in Australia and
\textsterling 34,855 in the UK \cite{ABSWeeklyEarnings,ONSWeeklyEarnings}).
Acute absenteeism for an MI was set at 55 ($\pm$20\%) days \cite{WorcHLC2014},
and 90 days ($\pm$20\%) for stroke \cite{RadfordJRM2020}.
Chronic absenteeism for CVD and diabetes were set at 21.5 ($\pm$20\%) and 6 (2-10) days annually \cite{AIHWCDPW,BretonDC2013}.
The workforce non-participation ratios for MI and stroke were set at 1.46 (1.36, 1.55) and 1.92 (1.80, 2.06), respectively \cite{BinPlos2021},
and the workforce non-participation for diabetes took age and sex specific values \cite{ZhangJHE2009}.

\subsection{Scenario analyses}

We also conducted nine scenario analyses. In the first three, we varied
the Lp(a) threshold at which treatment occurs from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL),
149 nmol/L (70 mg/dL), and 236 nmol/L (110 mg/dL), respectively. 

In the fourth, we assumed LDL-C lowering with statins would causally increase type 2 diabetes risk,
in line with statin trials showing a consistent relationship between the degree of 
LDL-C lowering and risk of type 2 diabetes \cite{ReithLDE2024}, which is supported by
Mendelian randomisation studies \cite{FerenceNEJM2016,LottaJAMA2016}. 
To determine the maximum negative impact this effect on diabetes could have, 
we simulated this as a worst-case scenario for statins causing diabetes
and adopted several unlikely assumptions:
we assumed that statin-induced diabetes led to a similar hazard for CVD
as diabetes itself (although offset at least in part by the LDL-C reduction
on the statin); we assumed that statin-induced diabetes would lead to a similar
reduction in quality of life as diabetes developed without statin
use (i.e., the utility for diabetes without complications), and similar costs;
and we assumed there would be no compensatory lifestyle modification. 
Even in this scenario, the LDL-C lowering effect of statins will still offset
the effect on diabetes diabetes risk such that CVD risk is still much lower
for individuals receiving statins than not receiving statins.

In the fifth scenario, we changed the threshold for initiating statins in the 
population not recommended for ``very high risk'' treatment from 5.0 mmol/L
to 3.0 mmol/L. 
In the sixth we changed the threshold for initiating blood pressure lowering in the 
population not recommended for ``very high risk'' treatment from 160 mmHg
to 140 mmHg. 

In the seventh, we used a moderate intensity statin, rather than a high intensity statin. 
In Australia, the most common moderate intensity statin was Rosuvastatin
10 mg once per day \cite{PBSDOS23}, which leads to an LDL-C reduction of 45.6\% \cite{Rosuvacochrane} and costs \$194 per year
in Australia \cite{PBSDOS23} and \textsterling 13.44 per year in the UK \cite{NHSDrugTariff062023}. 

In the eighth, we used 0\% annual discounting. 
In the ninth, we changed the cost of the blood pressure lowering therapy to reflect
the cost of a triple combination pill (as opposed to three separate pills in the primary analysis),
reducing the cost from \$555 to \$340 \cite{PBSDOS23}. This scenario was only performed in Australia
given that medication costs in the UK are already extremely low. 


\section{Supplementary results}

In the worst case scenario in which statins 
were assumed to causally increase the risk of type 2 diabetes, 
Lp(a) testing prevented CVD and resulted in a QALY gain (54 and 63
QALYs gained in Australia and the UK, respectively), 
and remained cost-effective from the healthcare perspective 
in the UK (ICER \textsterling 10,800 per QALY), but the ICER was marginally higher
than the willingness-to-pay threshold in Australia (ICER \$32,602 per QALY; 
Supplementary Tables~\ref{BCDtabsce4a} and~\ref{BCDtabsce4u}). 

In the scenario where LDL-C lowering for all people not at very high CVD risk was initiated at a threshold
of 3.0 mmol/L (not 5.0 mmol/L, as in the base case), significantly less cardiovascular events
were prevented by Lp(a) testing (a total of 13 MIs and strokes, down from 38 in the base case).
The intervention still led to a QALY gain (31 in Australia and 37 in the UK), but ICERs were
increased to \$32,223 and \textsterling 3,650 per QALY
in Australia and the UK, respectively (Supplementary Tables~\ref{BCDtabsce5a} and~\ref{BCDtabsce5u}). 

In the scenario where SBP lowering for all people not at very high CVD risk was initiated at a threshold
of 140 mmHg (not 160 mmHg), slightly less cardiovascular events
were prevented by Lp(a) testing (a total of 29 MIs and strokes, down from 38 in the base case),
although QALY gain was comparable with the base case while incremental medication
costs were lower than the base case in Australia (but not the UK), 
leading to a more favouable ICER than the base case in Australia (\$7,989 per QALY)
and a similar ICER in the UK ($-$\textsterling 3,157 per QALY; 
Supplementary Tables~\ref{BCDtabsce6a} and~\ref{BCDtabsce6u}).
ICERs were virtually identical to the base case when using a moderate
intensity statin (Supplementary Tables~\ref{BCDtabsce7a} and~\ref{BCDtabsce7u}).

With 0\% annual discounting, the QALY gain with Lp(a) testing compared to standard of care was greater than
in the base case (207 vs. 82 in Australia; 190 vs. 98 in the UK) and cost savings greater; 
but conclusions about cost-effectiveness were unaffected in this scenario 
(Supplementary Tables~\ref{BCDtabsce8a} and~\ref{BCDtabsce8u}).
Using the combination price for the blood pressure-lowering intervention lowered the ICER 
in Australia (compared to the base case) to \$6,797 per QALY (Supplementary Table~\ref{BCDtabsce9a}). 

\clearpage
\begin{landscape}
\thispagestyle{empty}
\section{Supplementary Tables}

\begin{table}[h!]
\centering
    \caption{Mendelian randomisation estimates of associations between risk factors and myocardial infarction,
stroke, and death from various causes.}
	\hspace*{-1cm}
    \label{MRinputs}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{lllll}
\hline
Input & Value & Distribution & Source \\
\hline
LDL-C on incident MI & 2.083 (2.000, 2.222) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{FerenceJAMA2019} \\
Lp(a) on incident MI & 1.0054 (1.0045, 1.0062) per 1 mg/dL increase in lifetime Lp(a) & Log-normal & \cite{LaminaJAMAC2019} \\
SBP on incident MI & 1.058 (1.051, 1.064) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{FerenceJAMA2019} \\
Smoking on incident MI & 1.43 (1.22, 1.62) per 1 unit increase in the LSI & Log-normal & \cite{LevinJAMANO2021} \\
Diabetes on incident MI & 1.26 (1.08, 1.40) for diabetes vs. no diabetes & Log-normal & \cite{RossEHJ2015} \\
LDL-C on incident IS & 1.08 (1.03, 1.14) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{YuanAN2020} \\
Lp(a) on incident IS & 1.0035 (1.0023, 1.0045) per 1 mg/dL increase in lifetime Lp(a) & Log-normal & \cite{LarssonCirc2020} \\
SBP on incident IS & 1.027 (1.018, 1.037) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{WanHyp2021} \\
Smoking on incident IS & 1.33 (1.22, 1.46) per 1 unit increase in the LSI & Log-normal & \cite{LarssonAN2019} \\
Type 2 diabetes on incident IS & 1.74 (1.19, 2.47) for diabetes vs. no diabetes & Log-normal & \cite{GanDC2019} \\
SBP on incidence ICH & 1.039 (1.010, 1.069) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{WanHyp2021} \\
Smoking on incident type 2 diabetes & 1.21 (1.03, 1.41) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from bladder cancer & 2.52 (1.66, 3.81) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from colorectal cancer & 1.24 (1.06, 1.44) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from oesophageal cancer & 3.67 (1.67, 8.02) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from kidney cancer & 1.69 (1.04, 3.05) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from lung cancer & 13.64 (8.85, 21.03) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from ovarian cancer & 1.27 (1.04, 1.57) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from pancreatic cancer & 2.13 (1.15, 3.90) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
SBP on death from Pneumonia & 1.016 (1.008, 1.025) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{ZekavatMed2021} \\
Smoking on death from Pneumonia & 4.03 (3.16, 5.11) per 1 unit increase in the LSI & Log-normal & \cite{FlatbyCMI2022} \\
Smoking on death from COPD & 13.64 (8.85, 21.03) per 1 unit increase in the LSI & Log-normal & Inferred based on \cite{LarssonEBM2022,KingECM2020} \\
LDL-C on death from ALS & 1.09 (1.03, 1.14) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{ZengHMG2019} \\
Smoking on death from Parkinson's disease & 0.48 (0.27, 1.01) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
\hline
\end{tabular}
Abbreviations: 
LDL-C -- Low-density lipoprotein-cholesterol; 
MI -- Myocardial infarction; 
SBP -- Systolic blood pressure; 
Lp(a) -- Lipoprotein(a);
IS -- Ischaemic stroke;
ICH -- Intracerebral haemorrhage;
COPD -- chronic obstructive pulmonary disease;
ALS -- amyotrophic lateral sclerosis.
\end{table}

\clearpage
\thispagestyle{empty}
\begin{table}[h!]
\centering
    \caption{Epidemiological model inputs}
	\hspace*{-2cm}
    \label{Einputs}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{llll}
\hline
Input & Value & Distribution & Source \\
\hline
Transition probabilities & See Supplementary Figures~\ref{CVinc}-\ref{t2dincgph} & Log-normal & UK Biobank and \cite{PalBMJODRC2021} \\
Risk factor levels & See protocol & Normal and log-normal & UK Biobank \\
Effects of risk factors on outcomes & See Supplementary Table~\ref{MRinputs} & log-normal & Various \\
Effect of atorvastatin 80 mg & 51.7\% (51.2, 52.2) LDL-C reduction & Normal & \cite{AdamsCDSR2015} \\
Effect of losartan 100 mg, chlortalidone 25 mg, and amlodipine 10 mg & 20 mmHg ($\pm$ 25\%) SBP reduction & Normal & \cite{SPRINT2015} \\
\hline
\end{tabular}
\end{table}




\clearpage
\thispagestyle{empty}
\begin{table}[h!]
\centering
    \caption{Model inputs -- utilities}
	\hspace*{-2cm}
    \label{heaegtabu}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{lllll}
\hline
Category & Input & Value & Distribution & Source \\
\hline
\multirow{10}{*}{Utilities}
& Utility for no CVD or diabetes in Australia & Age and sex-specific (see Supplementary Figure~\ref{AgeUT}) & Beta & \cite{McCaffreyHQLO2016} \\
& Utility for no CVD or diabetes in the UK & Age and sex-specific ($\pm$ 5\%; see Supplementary Figure~\ref{AgeUTUK}) & Beta & \cite{ARAVIH2010} \\
& Chronic utility for diabetes & 0.785 (0.681, 0.889) & Beta & \cite{BeaudetVIH2014} \\
& Chronic utility for MI & 0.79 (0.73, 0.85) & Beta & \cite{BettsHQLO2020} \\
& Chronic utility for stroke &  0.65 (0.63, 0.67) & Beta & \cite{JoundiJAHA2022} \\
& Chronic utility for MI and stroke &  0.65 (0.63, 0.67) & Beta & \cite{JoundiJAHA2022} \\
& Chronic disutility for MI in diabetes & -0.055 (-0.067, -0.042) & Normal & \cite{BeaudetVIH2014} \\
& Chronic disutility for stroke in diabetes & -0.164 (-0.222, -0.105) & Normal & \cite{BeaudetVIH2014} \\
& Chronic disutility for MI and stroke in diabetes & -0.164 (-0.222, -0.105) & Normal & \cite{BeaudetVIH2014} \\
& Acute disutility for MI & -0.01125 ($\pm$ 20\%) & Normal & \cite{LaceyEJCN2004} \\
& Acute disutility for stroke & -0.03 ($\pm$ 20\%) & Normal & \cite{JoundiJAHA2022} \\
\hline
\end{tabular} \\
Abbreviations: 
CVD -- Cardiovascular disease;
MI -- Myocardial infarction.
\end{table}



\clearpage
\thispagestyle{empty}
\begin{table}[h!]
\centering
	\vspace*{-2cm}
    \caption{Model inputs -- costs}
	\hspace*{-3cm}
    \label{heaegtabc}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{lllll}
\hline
Category & Input & Value & Distribution & Source \\
\hline
\multirow{17}{*}{\specialcell{Direct healthcare costs -- \\ Australia}} 
& Chronic cost of diabetes & \$3,588 (2,816, 4539) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Chronic cost of MI & \$6,222 ($\pm$10\%) & Gamma & \cite{MarquinaEJPC2022,CobiacBMCPH2012} \\
& Chronic cost of stroke & \$4,388 ($\pm$10\%) & Gamma & \cite{MarquinaEJPC2022,CobiacBMCPH2012} \\
& Chronic cost of MI and stroke & \$6,222 ($\pm$10\%) & Gamma & \cite{MarquinaEJPC2022,CobiacBMCPH2012} \\
& Chronic cost of MI among people with diabetes & \$8,870 (6,804, 10,937) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Chronic cost of stroke among people with diabetes & \$8,870 (6,804; 10,937) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Chronic cost of MI and stroke among people with diabetes & \$8,870 (6,804; 10,937) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Acute cost of non-fatal MI & \$14,434 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Acute cost of non-fatal stroke & \$15,659 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Acute cost of fatal MI & \$3,363 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Acute cost of fatal stroke & \$13,154 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Lp(a) test cost & \$25 & Fixed & Current cost \\
& Annual cost of atorvastatin 80 mg & \$200 & Fixed & \cite{PBSDOS23} \\
& Annual cost of losartan 100 mg & \$200 & Fixed & \cite{PBSDOS23} \\
& Annual cost of chlortalidone 25 mg & \$143 & Fixed & \cite{PBSDOS23} \\
& Annual cost of amlodipine 10 mg & \$212 & Fixed & \cite{PBSDOS23} \\
\hline
\multirow{17}{*}{Direct healthcare costs -- UK} 
& Chronic cost of diabetes & \textsterling 2,546 (2,462, 2,633) in females; 
\textsterling 2,170 (2,090, 2,254) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI & \textsterling 3,304 (3,026, 3,607) in females; 
\textsterling 2,917 (2,701, 3,149) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of stroke & \textsterling 7,021 (5,852, 8,421) in females; 
\textsterling 7,351 (5,923, 8,062) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI and stroke & \textsterling 14,442 (9,929, 21,004) in females; 
\textsterling 12,616 (8,484, 18,756) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI in diabetes & \textsterling 4,511 (3,947, 5,155) in females; 
\textsterling 3,917 (3,480, 4,409) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of stroke in diabetes & \textsterling 10,014 (7,615, 13,167) in females; 
\textsterling 10,494 (7,701, 14,300) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI and stroke in diabetes & \textsterling 14,442 (9,929, 21,004) in females; 
\textsterling 12,616 (8,484, 18,756) in males & Gamma & \cite{PHEcosts2020} \\
& Acute cost of non-fatal MI & \textsterling 2,212 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Acute cost of non-fatal stroke & \textsterling 4,626 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Acute cost of fatal MI & \textsterling 515 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Acute cost of fatal stroke & \textsterling 3,886 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Lp(a) test cost & \textsterling 40 & Fixed & Assumption \\
& Annual cost of atorvastatin 80 mg & \textsterling 18.00 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of losartan 100 mg & \textsterling 15.91 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of chlortalidone 25 mg & \textsterling 12.42 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of amlodipine 10 mg & \textsterling 9.91 & Fixed & \cite{NHSDrugTariff062023} \\
\hline
\multirow{12}{*}{Indirect cost inputs} 
& Retirement age  -- Australia & 67 years & Fixed & Policy \\
& Retirement age  -- UK & 66 years & Fixed & Policy \\
& Average annual earnings -- Australia & \$73,003 & Fixed & \cite{ABSWeeklyEarnings} \\
& Average annual earnings -- UK & \textsterling 34,855 & Fixed & \cite{ONSWeeklyEarnings} \\
& Employment rates & Age and sex-specific & Fixed & \cite{ABSEmployment,ONSEmployment} \\
& Acute absenteeism for MI & 55 days ($\pm$20\%) & Normal & \cite{WorcHLC2014} \\
& Acute absenteeism for stroke & 90 days ($\pm$20\%) & Normal & \cite{RadfordJRM2020} \\
& Chronic absenteeism for CVD & 21.5 days annually ($\pm$20\%) & Normal & \cite{AIHWCDPW} \\
& Chronic absenteeism for diabetes & 6 days annually (2-10) & Normal & \cite{BretonDC2013} \\
& Workforce non-participation ratio for MI & 1.46 (1.36, 1.55) & Log-normal & \cite{BinPlos2021} \\
& Workforce non-participation ratio for stroke & 1.92 (1.80, 2.06) & Log-normal & \cite{BinPlos2021} \\
& Workforce non-participation reduction for diabetes & Age and sex-specific & Fixed & \cite{ZhangJHE2009} \\
\hline
\end{tabular}
Abbreviations: 
CVD -- Cardiovascular disease;
MI -- Myocardial infarction.
\end{table}
\end{landscape}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, females. Australia.}
    \label{BCDtaba1a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_1_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}
\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, males. Australia.}
    \label{BCDtaba2a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_2_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 40-49 at baseline. Australia.}
    \label{BCDtaba3a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_3_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 50-59 at baseline. Australia.}
    \label{BCDtaba4a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_4_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 60-69 at baseline. Australia.}
    \label{BCDtaba5a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_5_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}


\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, females. UK.}
    \label{BCDtaba1u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_1_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}
\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, males. UK.}
    \label{BCDtaba2u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_2_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 40-49 at baseline. UK.}
    \label{BCDtaba3u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_3_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 50-59 at baseline. UK.}
    \label{BCDtaba4u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_4_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary, people aged 60-69 at baseline. UK.}
    \label{BCDtaba5u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum_5_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 1: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). Australia.}
    \label{BCDtabsce1a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_1_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 2: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). Australia.}
    \label{BCDtabsce2a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_2_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 3: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). Australia.}
    \label{BCDtabsce3a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_3_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 4: LDL-C lowering with statins causes diabetes. Australia.}
    \label{BCDtabsce4a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_4_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}



\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 5: LDL-C lowering occurs at 3.0 mmol/L, not 5.0 mmol/L. Australia.}
    \label{BCDtabsce5a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_5_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 6: SBP lowering occurs at 140 mmHg, not 160 mmHg. Australia.}
    \label{BCDtabsce6a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_6_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 7: Moderate intensity statin. Australia.}
    \label{BCDtabsce7a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_7_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 8: 0\% discounting. Australia.}
    \label{BCDtabsce8a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_8_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 9: Combination price for anti-hypertensive therapy. Australia.}
    \label{BCDtabsce9a}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_9_1.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 1: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). UK.}
    \label{BCDtabsce1u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_1_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 2: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). UK.}
    \label{BCDtabsce2u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_2_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 3: Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). UK.}
    \label{BCDtabsce3u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_3_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 4: LDL-C lowering with statins causes diabetes. UK.}
    \label{BCDtabsce4u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_4_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}



\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 5: LDL-C lowering occurs at 3.0 mmol/L, not 5.0 mmol/L. UK.}
    \label{BCDtabsce5u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_5_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 6: SBP lowering occurs at 140 mmHg, not 160 mmHg. UK.}
    \label{BCDtabsce6u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_6_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 7: Moderate intensity statin. UK.}
    \label{BCDtabsce7u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_7_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Scenario 8: 0\% discounting. UK.}
    \label{BCDtabsce8u}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum_8_2.csv}
  \end{center}
Abbreviations: 
ICER -- Incremental cost-effectiveness ratio;
Lp(a) -- Lipoprotein(a);
MI -- Myocardial infarction;
QALY -- Quality-adjusted life year(s);
SICER -- Incremental cost-effectiveness ratio (societal perspective);
YLL -- Years of life lived.
\end{table}


\clearpage
\begin{landscape}
\begin{table}[h!]
  \begin{center}
    \caption{Probablistic sensitivity analysis results for Lp(a) testing (intervention) compared to standard of care (control).
Full results are shown in the protocol.}
    \label{PSAtab}
     \fontsize{7pt}{9pt}\selectfont\pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
		every row no 8/.style={before row=\hline},
		every row no 19/.style={before row=\hline},
    ]{CSV/PSArestabsumpaper.csv}
  \end{center}
The willingness-to-pay threshold was \$28,000 per QALY gained in Australia \cite{EdneyPHEC2018}
and \textsterling 20,000 to \textsterling 30,000 per QALY in the UK \cite{NICEHTA2013}. \\
\noindent Abbreviations: 
MI -- Myocardial infarction;
YLL -- Years of life lived;
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}
\end{landscape}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Expanded base case results for Lp(a) testing (intervention) compared to standard of care (control). Australia.}
    \label{BCDtabfa}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestab_1.csv}
  \end{center}
Abbreviations: 
MI -- Myocardial infarction;
YLL -- Years of life lived;
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Expanded base case results for Lp(a) testing (intervention) compared to standard of care (control). UK.}
    \label{BCDtabfu}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestab_2.csv}
  \end{center}
Abbreviations: 
MI -- Myocardial infarction;
YLL -- Years of life lived;
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}


\clearpage
\section{Supplementary Figures}

\begin{figure}[h!]
    \centering
    \caption{Model structure. The model has the following health states: 1) No history of 
MI, stroke, or diabetes; 2) MI; 
3) stroke; 4) diabetes; 5) MI and stroke;
6) MI and diabetes; 7) stroke and diabetes; 8) MI, stroke and diabetes; 
and 9) death. Repeat events can occur, but do not involve state transitions. 
Abbreviation -- MI: Myocardial infarction.}
    \includegraphics[width=1\textwidth]{Structure.pdf}
    \label{Schematic}
\end{figure}

***/

texdoc stlog, nolog
graph combine ///
GPH/asr_nfMI.gph ///
GPH/asr_fMI.gph ///
GPH/asr_nfIS.gph ///
GPH/asr_fIS.gph ///
GPH/asr_nfICH.gph ///
GPH/asr_fICH.gph ///
, graphregion(color(white)) altshrink cols(2) xsize(4)
texdoc graph, label(CVinc) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific incidence of CVD, by CVD type.)
graph combine ///
GPH/asr_oescdeath.gph ///
GPH/asr_colcdeath.gph ///
GPH/asr_pancdeath.gph ///
GPH/asr_luncdeath.gph ///
GPH/asr_ovacdeath.gph ///
GPH/asr_kidcdeath.gph ///
GPH/asr_blacdeath.gph ///
GPH/asr_pneudeath.gph ///
GPH/asr_copddeath.gph ///
GPH/asr_alsdeath.gph ///
GPH/asr_pddeath.gph ///
GPH/asr_otherdeath.gph ///
, graphregion(color(white)) altshrink cols(3) xsize(4)
texdoc graph, label(codmr) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific mortality rate, by cause of death. ///
Other causes includes all other causes except CHD, IS, and ICH. \\ ///
Abbreviations: COPD -- Chronic obstructive pulmonary disease; ///
ALS -- amyotrophic lateral sclerosis.)
graph combine ///
GPH/pevasr_nfMI_1.gph ///
GPH/pevasr_nfMI_2.gph ///
GPH/pevasr_nfMI_3.gph ///
GPH/pevasr_fMI_1.gph ///
GPH/pevasr_fMI_2.gph ///
GPH/pevasr_fMI_3.gph ///
GPH/pevasr_nfS_1.gph ///
GPH/pevasr_nfS_2.gph ///
GPH/pevasr_nfS_3.gph ///
GPH/pevasr_fS_1.gph ///
GPH/pevasr_fS_2.gph ///
GPH/pevasr_fS_3.gph ///
GPH/pevasr_othd_1.gph ///
GPH/pevasr_othd_2.gph ///
GPH/pevasr_othd_3.gph ///
, graphregion(color(white)) altshrink cols(3) xsize(4)
texdoc graph, label(CVincpev) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific incidence of recurrent CVD or death, by CVD type and starting health state.)
clear
append using INC/t2d_0 INC/t2d_1
replace rate = rate*1000
gen lb = exp(ln(rate)-1.96*errr)
gen ub = exp(ln(rate)+1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 1, color(blue) lpattern(solid)) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) yscale(nolog range(0 15)) ///
graphregion(color(white)) ///
ylabel(0(3)15, angle(0) format(%9.0f)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Incidence rate (per 1,000 person-years)") ///
xtitle("Age (years)")
texdoc graph, label(t2dincgph) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific incidence of type 2 diabetes in the UK. ///
Data were derived from Pal et al. \cite{PalBMJODRC2021}.)
use UTvals_AU, clear
twoway ///
(rarea UTub UTlb age if sex == 0, col(red%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 0, color(red)) ///
(rarea UTub UTlb age if sex == 1, col(blue%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 1, color(blue)) ///
, legend(order(4 "Male" ///
2 "Female") ///
cols(1) ring(0) position(1) region(lcolor(white) color(none))) ///
graphregion(color(white)) ///
ytitle(Utility) xtitle(Age) ///
ylabel(,angle(0) format(%9.2f)) xlabel(40(10)80)
texdoc graph, label(AgeUT) figure(h!) cabove fontface("Liberation Sans") caption(Age and sex-specific utility for people without CVD or diabetes in Australia.)
use UTvals_UK, clear
gen UTlb = UT-(UT*0.0255*1.96)
gen UTub = UT+(UT*0.0255*1.96)
twoway ///
(rarea UTub UTlb age if sex == 0, col(red%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 0, color(red)) ///
(rarea UTub UTlb age if sex == 1, col(blue%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 1, color(blue)) ///
, legend(order(4 "Male" ///
2 "Female") ///
cols(1) ring(0) position(1) region(lcolor(white) color(none))) ///
graphregion(color(white)) ///
ytitle(Utility) xtitle(Age) ///
ylabel(,angle(0) format(%9.2f)) xlabel(40(10)80)
texdoc graph, label(AgeUTUK) figure(h!) cabove fontface("Liberation Sans") caption(Age and sex-specific utility for people without CVD or diabetes in the UK.)
graph combine ///
GPH/cuminc_MI.gph ///
GPH/cuminc_Stroke.gph ///
GPH/cuminc_CVD.gph ///
GPH/cuminc_Death.gph ///
, graphregion(color(white)) cols(2) altshrink xsize(5)
texdoc graph, label(cumincf) figure(h!) cabove fontface("Liberation Sans") ///
caption(Cumulative incidence of MI, stroke, CVD, and death for Lp(a) ///
testing (intervention) compared to standard of care (control).)
graph combine ///
GPH/OSAT_1.gph ///
GPH/OSAT_2.gph ///
, graphregion(color(white)) iscale(0.3) xsize(1.5) ysize(2.2) cols(2) 
texdoc graph, label(OSAfig) figure(h!) cabove fontface("Liberation Sans") ///
caption(Tornado diagrams for one-way sensitivity analyses. ///
These show the incremental cost-effectiveness ratio (ICER) at the lower and upper bounds of each model input. ///
No single input impacted the ICER to a point where conclusions about cost-effectiveness were affected.)
texdoc stlog close

/***

\clearpage
\begin{table}[h!]
\caption{CHEERS 2022 Checklist}
\centering
\hspace*{-1cm}
\fontsize{6pt}{8pt}\selectfont\begin{tabular}{p{0.15\textwidth}p{0.05\textwidth}p{0.6\textwidth}p{0.2\textwidth}}
\hline
Topic & No. & Item & Location where item is reported \\
\hline
\textbf{Title} &  &  & \\
\hline
Title & 1 & Identify the study as an economic evaluation and specify the interventions being compared. & Title \\
\hline
\textbf{Abstract} &  &  & \\
\hline
Abstract & 2 & Provide a structured summary that highlights context, key methods, results, and alternative analyses. & Abstract \\
\hline
\textbf{Introduction} &  &  & \\
\hline
Background and objectives & 3 & Give the context for the study, the study question, and its practical relevance for decision making in policy or practice. & Introduction \\
\hline
\textbf{Methods} &  &  & \\
\hline
Health economic analysis plan & 4 & Indicate whether a health economic analysis plan was developed and where available. & N/A \\
\hline
Study population & 5 & Describe characteristics of the study population (such as age range, demographics, socioeconomic, or clinical characteristics). & Table 1 \\
\hline
Setting and location & 6 & Provide relevant contextual information that may influence findings. & Methods: Epidemiological inputs \\
\hline
Comparators & 7 & Describe the interventions or strategies being compared and why chosen. & Methods: Population, intervention, and control \\
\hline
Perspective & 8 & State the perspective(s) adopted by the study and why chosen. & Methods: Health economic inputs \\
\hline
Time horizon & 9 & State the time horizon for the study and why appropriate. & Methods: Model overview \\
\hline
Discount rate & 10 & Report the discount rate(s) and reason chosen. & Methods: Health economic inputs \\
\hline
Selection of outcomes & 11 & Describe what outcomes were used as the measure(s) of benefit(s) and harm(s). & Methods: Outcomes \\
\hline
Measurement of outcomes & 12 & Describe how outcomes used to capture benefit(s) and harm(s) were measured. & Methods: Health economic inputs \\
\hline
Valuation of outcomes & 13 & Describe the population and methods used to measure and value outcomes. & Methods: Health economic inputs \\
\hline
Measurement and valuation of resources and costs & 14 & Describe how costs were valued. & Methods: Health economic inputs \\
\hline
Currency, price date, and conversion & 15 & Report the dates of the estimated resource quantities and unit costs, plus the currency and year of conversion. & Methods: Health economic inputs \\
\hline
Rationale and description of model & 16 & If modelling is used, describe in detail and why used. Report if the model is publicly available and where it can be accessed. & Methods: Movel overview \\
\hline
Analytics and assumptions & 17 & Describe any methods for analysing or statistically transforming data, any extrapolation methods, and approaches for validating any model used. & Protocol \\
\hline
Characterising heterogeneity & 18 & Describe any methods used for estimating how the results of the study vary for subgroups. & Methods: Outcomes \\
\hline
Characterising distributional effects & 19 & Describe how impacts are distributed across different individuals or adjustments made to reflect priority populations. & N/A \\
\hline
Characterising uncertainty & 20 & Describe methods to characterise any sources of uncertainty in the analysis. & Methods: Sensitivity and scenario analyses \\
\hline
Approach to engagement with patients and others affected by the study & 21 & Describe any approaches to engage patients or service recipients, the general public, communities, or stakeholders (such as clinicians or payers) in the design of the study. & Acknowledgements \\
\hline
\textbf{Results} &  &  & \\
\hline
Study parameters & 22 & Report all analytic inputs (such as values, ranges, references) including uncertainty or distributional assumptions. & Supplementary Appendix \\
\hline
Summary of main results & 23 & Report the mean values for the main categories of costs and outcomes of interest and summarise them in the most appropriate overall measure. & Table 2 \\
\hline
Effect of uncertainty & 24 & Describe how uncertainty about analytic judgments, inputs, or projections affect findings. Report the effect of choice of discount rate and time horizon, if applicable. & Results: Sensitivity and scenario analyses \\
\hline
Effect of engagement with patients and others affected by the study & 25 & Report on any difference patient/service recipient, general public, community, or stakeholder involvement made to the approach or findings of the study & N/A \\
\hline
\textbf{Discussion} &  &  & \\
\hline
Study findings, limitations, generalisability, and current knowledge & 26 & Report key findings, limitations, ethical or equity considerations not captured, and how these could affect patients, policy, or practice. & Discussion \\
\hline
\textbf{Other relevant information} &  &  & \\
\hline
Source of funding & 27 & Describe how the study was funded and any role of the funder in the identification, design, conduct, and reporting of the analysis & Acknowledgements \\
\hline
Conflicts of interest & 28 & Report authors conflicts of interest according to journal or International Committee of Medical Journal Editors requirements. & Acknowledgements \\
\hline
\end{tabular}
From: Husereau D, Drummond M, Augustovski F, et al. Consolidated Health 
Economic Evaluation Reporting Standards 2022 (CHEERS 2022) 
Explanation and Elaboration: A Report of the ISPOR CHEERS II 
Good Practices Task Force. Value Health 2022.
\end{table}



\clearpage
\section*{References}
\bibliography{Library/Library.bib}
\end{document}

***/

texdoc close

**# Bookmark #2

texdoc init LPA_MS1, replace logdir(LPA_MS1_dir) gropts(optargs(width=0.8\textwidth))
set linesize 100

/***
\documentclass[11pt]{article}
\usepackage{fullpage}
\usepackage{siunitx}
\usepackage{hyperref,graphicx,booktabs,dcolumn}
\usepackage{stata}
\usepackage[x11names]{xcolor}
\usepackage{natbib}
\usepackage{chngcntr}
\usepackage{pgfplotstable}
\usepackage{pdflscape}
\usepackage{amssymb}
\usepackage{multirow}
\usepackage{booktabs}
\usepackage[section]{placeins}

\usepackage{xr}
\externaldocument{LPA_MS1_A}

\newcommand{\specialcell}[2][c]{%
  \begin{tabular}[#1]{@{}l@{}}#2\end{tabular}}

\newcommand{\specialcelr}[2][c]{%
  \begin{tabular}[#1]{@{}r@{}}#2\end{tabular}}

\usepackage[superscript,biblabel,compress]{cite}


\newcommand{\thedate}{\today}

\bibliographystyle{unsrt}
\renewcommand{\bibsection}{}
\makeatletter
\renewcommand\@biblabel[1]{	#1.}
\makeatother

\begin{document}

\begin{titlepage}
    \begin{flushright}
        \Huge
        \textbf{
Lp(a) testing for the primary prevention of cardiovascular disease in high-income countries: a cost-effectiveness analysis
}
\rule{16cm}{2mm} \\
\Large
Manuscript \\
\thedate \\
       \vfill
    \end{flushright}
        \Large

\noindent
Jedidiah I Morton, PhD,\footnote{\label{HEPER}Health Economics and Policy Evaluation Research (HEPER) Group, Centre for Medicine Use and Safety, Faculty of Pharmacy and Pharmaceutical Sciences, Monash University, Melbourne, Australia.}\textsuperscript{,}\footnote{Diabetes and Population Health, Baker Heart and Diabetes Institute, Melbourne, Australia.}
Florian Kronenberg, MD,\footnote{Institute of Genetic Epidemiology, Medical University of Innsbruck, Innsbruck, Austria.}
Magdalena Daccord,\footnote{\label{FHE}FH Europe Foundation, Amsterdam, the Netherlands.}
Nicola Bedlington,\textsuperscript{\ref{FHE}}
Marius Geant{\u a}, MD, PhD,\footnote{Center for Innovation in Medicine, Bucharest, Romania.}
Tobias Silberzahn, PhD,\textsuperscript{\ref{FHE}}
Zhenyue Chen, MD, PhD,\footnote{Department of Cardiovascular Medicine, Shanghai Ruijin Hospital, Shanhai Jiaotong University School of Medicine, China.}
Jean-Luc Eisel{\'e}, MD,\footnote{World Heart Federation (WHF), Geneva, Switzerland.}
Bogi Eliasen,\footnote{Copenhagen Institute for Futures Studies, Copenhagen, Denmark.}
Mariko Harada-Shiba, MD, PhD,\footnote{Cardiovascular Center, Osaka Medical and Pharmaceutical University, Japan.}
Marc Rijken,\textsuperscript{\ref{FHE}}
Albert Wiegman, MD, PhD,\textsuperscript{\ref{FHE}}
George Thanassoulis, MD, MSc, FRCPC,\footnote{MUHC Preventive and Genomic Cardiology, McGill University, Canada.}
Pia R Kamstrup, MD PhD DMSc,\footnote{\label{CUH}Department of Clinical Biochemistry, Copenhagen University Hospital -- Herlev and Gentofte}\textsuperscript{,}\footnote{\label{UCD}Department of Clinical Medicine, University of Copenhagen, Denmark}
I{\~n}aki Guti{\'e}rrez Ibarluzea, PhD,\footnote{Ministry of Health, Basque Country, Spain.}
Pablo Coral, MD,\footnote{FASTA University, Pharmacology Department, School of Medicine, Mar del Plata, Argentina.}
Raul D Santos MD, PhD,\footnote{Academic Research Organization, Hospital Israelita Albert Einstein, Sao Paulo, Brazil.}\textsuperscript{,}\footnote{Lipid Clinic Heart Institute (InCor) University of Sao Paulo Medical School Hospital, Sao Paulo, Brazil.} 
Erik Stroes MD, PhD,\footnote{Department of Vascular Medicine, Academic Medical Centre, Amsterdam, The Netherlands.}
Gerald F Watts, DSc, MD, PhD,\footnote{Medical School, The University of Western Australia}\textsuperscript{,}\footnote{Departments of Internal Medicine and Cardiology, Royal Perth Hospital, Perth, Western Australia.}
Christie M Ballantyne, MD,\footnote{Baylor College of Medicine, Houston, TX, USA.}
Samia Mora, MD, MHS,\footnote{Brigham and Women's Hospital, Harvard Medical School Boston, USA.}
B{\o}rge G Nordestgaard, MD, DMSc,\textsuperscript{\ref{CUH},\ref{UCD}}
Kausik K Ray, FMedSci,\footnote{Department of Public Health and Primary Care, Imperial College London, London, United Kingdom.}
Stephen J Nicholls, MBBS, PhD,\footnote{Victorian Heart Institute, Monash University, Australia}
Zanfina Ademi, PhD.\textsuperscript{\ref{HEPER},}\footnote{School of Public Health and Preventive Medicine, Monash University, Melbourne, Australia}\footnote{Central Clinical School, Monash University, Melbourne, Australia}\footnote{School of Pharmacy, University of Eastern Finland, Kuopio, Finland} \\
On behalf of the Lp(a) International Taskforce (ITF) initiative. \\
 \\
\clearpage
\noindent
Correspondence to: \\
Jedidiah Morton;  
\color{blue}
\href{mailto:Jedidiah.Morton@Monash.edu}{Jedidiah.Morton@monash.edu} \\ 
\color{black}
\noindent
Zanfina Ademi; 
\color{blue}
\href{mailto:Zanfina.Ademi@Monash.edu}{Zanfina.Ademi@monash.edu} \\ 
\color{black}

\noindent
Abstract word count: 250 \\
Manuscript word count: 4,950 \\ 
Number of tables: 3 \\
Number of Figures: 3 \\
\end{titlepage}

\clearpage
\section*{Abstract}

\textbf{Background and Aims} \\
Cost-effectiveness of Lipoprotein(a) [Lp(a)] testing is not established.
We aimed to evaluate the cost-effectiveness 
of Lp(a) testing in the cardiovascular disease (CVD) primary prevention population 
from healthcare and societal perspectives. \\

\noindent \textbf{Methods} \\
We constructed and validated a multi-state microsimulation Markov model
for a population of 10,000 individuals
aged between 40 and 69 years without CVD, 
selected randomly from the UK Biobank. 
The model evaluated Lp(a) testing in individuals
not initially classified as high-risk based on age, 
diabetes status, or the SCORE-2 algorithm.
Those with an Lp(a) level $\geq$192 nmol/L (90 mg/dL) 
were treated as high risk (initiation of a statin plus
blood pressure lowering). The Lp(a) testing intervention was compared to standard of care. 
The primary analyses were conducted from the Australian and UK healthcare
perspectives in 2023AUD/GBP. A cost adaptation method estimated
cost-effectiveness in multiple European countries, Canada, and the USA. \\

\noindent \textbf{Results} \\
Among 10,000 individuals, 624 had their treatment modified
from Lp(a) testing.
This led to 82 and 98 quality-adjusted life years gained in
Australia and the UK, respectively, with corresponding incremental cost-effectiveness ratios
of 11,369 (cost-effective) and $-$3,356 (cost-saving). 
From a societal perspective, Lp(a) 
testing saved \$60 and \textsterling 107 per person in Australia
and the UK, respectively. 
Lp(a) testing was cost-saving among all countries tested in the cost adaptation analysis. \\

\noindent \textbf{Conclusions} \\
Lp(a) testing in the primary prevention population to reclassify CVD risk and treatment
is cost-saving and warranted to prevent CVD.

\clearpage
\section*{Introduction}

Lipoprotein(a) [Lp(a)] is an important risk factor for cardiovascular disease (CVD)\cite{KronEHJ2022,NordLancet2024}.
Although the relationship between Lp(a) concentration and CVD risk is continuous \cite{KronEHJ2022},
risk enhancing thresholds guide clinical practice.
Depending on the threshold used to define ``high'' Lp(a), anywhere from $\sim$10-20\% of individuals
have high Lp(a) \cite{KronEHJ2022}.
However, Lp(a) is not routinely measured in clinical practice at present. As a consequence, the overwhelming
majority of individuals
with high Lp(a) are unaware of their status and thus do not modify their CVD risk 
by initiating preventive measures. 

While highly effective treatments to lower Lp(a) are in a late stage of development \cite{NordLancet2024},
there are currently no clinically available options for lowering Lp(a) potently and selectively (beyond lipoprotein apheresis).
Nevertheless, Lp(a) measurement can be used to reclassify risk and prompt more intensive management
of other cardiovascular risk factors that might otherwise go untreated in an effort to lower
overall cardiovascular risk without directly lowering Lp(a) \cite{KronEHJ2022}. 
Thus, widespread Lp(a) testing could be a useful way to improve the prevention of CVD
in the population by identifying individuals at higher CVD risk than current risk scores
estimate. 

Lp(a) is a good screening candidate. 
More than $>$90\% of the concentration of Lp(a) is 
genetically determined \cite{BoerJCI1992,CoassinAth2022},
although genetic testing is not required to measure it.
Hence, many guidelines recommend that Lp(a) needs to be measured only
once in a lifetime in most people.
The test cost is relatively inexpensive, ranging from a few dollars to 
approximately US\$50, depending on the jurisdiction.
These factors make Lp(a) screening followed by advice to modify treatment
of other cardiovascular risk factors
a potentially attractive option for CVD prevention.

However, while guidelines and society consensus statements 
have recommended the implementation of Lp(a) testing \cite{KronEHJ2022,NordLancet2024},
to date, no studies have evaluated the cost-effectiveness of widespread Lp(a) testing,
which is a key step in assessing the feasibility of implementing these recommendations.
The feasibility of Lp(a) testing is especially important as European governments
are currently developing cardiovascular health plans that could dictate
whether or not Lp(a) testing is made widely available \cite{ESCPR24}.

Therefore, we have constructed a state-of-the-art health economic model to evaluate the cost-effectiveness 
of testing for Lp(a) in the primary prevention population, where testing is assumed to be followed
by more intensive treatment of other cardiovascular risk factors in the population
with high Lp(a), compared to current standard of care, as defined by 
the European guidelines for CVD prevention \cite{VisserenEHJ2021}. The primary analysis was conducted
from the Australian and UK national healthcare system and societal perspectives, with secondary analyses 
adapting the results to other high-income countries in Europe and North America. 


\clearpage
\section*{Methods}

All analysis syntax and a more detailed explanations of the methods are available in an online protocol 
(available at: \color{blue}\href{https://github.com/jimb0w/LPAtesting}{https://github.com/jimb0w/LPAtesting}\color{black}). 
All analyses were conducted in Stata, Version 17.0 (StataCorp, Texas, USA). 
We have completed this study in accordance with the CHEERS checklist (Appendix).

\subsection*{Model overview}

The model is represented schematically in Supplementary Figure~\ref{Schematic}.
We constructed a microsimulation model that ages people in 1-year cycles from
the age they enter the model (40-69 years) to age 85 years. 
The model tracks the occurrence of cardiovascular events, both incident
and recurrent. The cardiovascular events included in the model were myocardial infarction (MI) and stroke 
(ischemic and hemorrhagic), selected as the two most common forms of CVD \cite{RothJACC2020}.

Risk of MI and stroke in the primary prevention population was determined by age,
sex, low-density lipoprotein-cholesterol (LDL-C) concentration, systolic blood pressure (SBP), 
Lp(a) concentration, diabetes, and smoking. 
The modifiable risk factors (other than Lp(a)) were selected as 
among the longest-standing and most evidenced-based
causal risk factors for CVD \cite{WilsonCirc1998,GoffCirc2014}. 

The microsimulation model had the following health states: 1) No history of 
MI, stroke, or diabetes; 2) MI; 
3) stroke; 4) diabetes; 5) MI and stroke;
6) MI and diabetes; 7) stroke and diabetes; 8) MI, stroke and diabetes; 
and 9) death.
Repeat events (i.e., recurrent MI and stroke) were 
also tracked throughout the model time horizon.

The effects of LDL-C, SBP, Lp(a), and smoking on the risk of MI, stroke, and death from other causes
was proportional to both magnitude and duration of exposure (i.e., the concept of cholesterol-years, pack-years, etc.).
In line with our methodological framework \cite{AdemiAth2020,MacVIH2022,MortonPECA2023,AdemiJAMP2023,MortonVIH2024,MortonPECA2024}, 
we assumed that risk of CVD was proportional to the cumulative
exposure to a risk factor at a given age, an assumption which is supported 
by a substantial body of evidence \cite{PopeAQAH2010,BurgessJAMAC2018,FerenceJAMA2019,LaminaJAMAC2019}. 
Thus, the model adjusts 
the risk of CVD and death from other causes based on lifetime exposure to these risk factors. 
The effect of diabetes on the risk of MI, stroke, and death from other causes was binary. 

The relationship between exposure to a risk factor and the risk of CVD or death was quantified
using estimates from Mendelian randomisation 
studies \cite{FerenceJAMA2019,LaminaJAMAC2019,LevinJAMANO2021,RossEHJ2015,YuanAN2020,LarssonCirc2020,WanHyp2021,LarssonAN2019,GanDC2019,LarssonEBM2022,ZekavatMed2021,FlatbyCMI2022,KingECM2020,ZengHMG2019}. 
The relationship of each risk factor with MI, stroke, and death from other causes is shown in Supplementary Table~\ref{MRinputs}.

The risk of cardiovascular events and death from other causes after an individual 
had developed MI or stroke in the model
was related to age, sex, prior MI status, and prior stroke status. 

The model was validated using tests based on the AdViSHE tool \cite{ADVISHE} and calibrated using data
from clinical trials. Results of the validation and calibration are presented in the online protocol. 


\subsection*{Epidemiological inputs}

The principal source of data for epidemiologic inputs to the model was the UK Biobank study \cite{SudlowPLOSMED2015}.
The UK Biobank enrolled over 500,000 participants between 2006 and 2010, 
with follow-up data available until 2021. Epidemiologic inputs
are summarised in Supplementary Table~\ref{Einputs}.

To estimate the incidence of MI (fatal and non-fatal), 
stroke (fatal and non-fatal), 
and mortality not due to coronary heart disease 
or stroke, prior to the development of MI or stroke, 
we used age-period-cohort models \cite{CarstensenSTATMED2007},
which are descriped in full in the Supplementary Methods.
The incidence of outcomes prior to the development of 
MI or stroke is shown in Supplementary Figures~\ref{CVinc}-\ref{codmr}. 
We followed a similar approach to estimate the incidence of MI, stroke, 
and mortality not due to coronary heart disease 
or stroke, following the development of MI or stroke (Supplementary Figure~\ref{CVincpev}). 
Because the UK Biobank does not contain reliable data on the incidence of diabetes, 
we derived the age and sex-specific incidence of diabetes from Pal et al. \cite{PalBMJODRC2021},
as this study contained the most recent diabetes incidence data for the UK (Supplementary Figure~\ref{t2dincgph}).

Data on risk factor trajectories were also mostly informed by data from the UK Biobank,
but also necessitate several assumptions, which we drew from published literature. 
These assumptions and how the effect of risk factors on the incidence of 
outcomes was incorporated is explained in the Supplementary Methods.

Notably, we imputed Lp(a) values for a subset of the sample with missing Lp(a) -- 
the UK Biobank original data extract does 
not contain Lp(a) values for people with an Lp(a) of 189.1 nmol/L (88.5 mg/dL) and above (approximately
7\% of the population), and the return 
in which these have been calculated is not yet available on the current version
of the UK Biobank analysis platform. 
Nevertheless, we have previously shown 
this imputation is accurate and inconsequential 
for the purposes of our modelling approach \cite{MortonVIH2024}. 

\subsection*{Population, intervention, and control}

The study population consisted of individuals without CVD
(defined as prior MI and/or stroke), initially aged between 40 and 69 years. 
People aged 70 and above were excluded
because they are considered high risk and 
are recommended treatment by current guidelines \cite{VisserenEHJ2021}, meaning testing
for Lp(a) with the goal of modifying traditional risk factors would not be appropriate. 

People aged below 40 years were also excluded from the study population because
they are not part of the Systemic Coronary Risk Estimation (SCORE2) 
algorithm and thus there are no risk treatment thresholds,
are rarely recommended for pharmacological treatment in current guidelines\cite{VisserenEHJ2021},
and were not present in the UK Biobank sample in sufficient numbers (as they were outside of the target
recruitment population).

We populated our model with 10,000 randomly selected individuals from the UK Biobank 
study who were aged between 40 and 69, without prior CVD,
who had information on their LDL-C, Lp(a) (measured or imputed), 
SBP, and high-density lipoprotein-cholesterol.

The standard of care (control) scenario was based on the European guidelines for 
CVD prevention \cite{VisserenEHJ2021}. The guidelines are designed to be individually specific;
therefore, we simplified the guidelines to the following points for the purposes of the analyses. 
First, all individuals with diabetes received both a high intensity statin 
(regardless of baseline LDL-C because 
statins reduce CVD risk regardless of baseline LDL-C  levels \cite{CTTLancet2005}) and 
pharmacological treatment for hypertension if they had an SBP of $\geq$140 mmHg.
Second, all individuals without diabetes aged 40 and above were tested for CVD risk every 5 years
using the updated SCORE2 algorithm \cite{SCORE2}.
Third, individuals deemed ``Very high risk'' from SCORE2 were treated with a 
high intensity statin (again, regardless of LDL-C) 
and received pharmacological anti-hypertensive treatment if they had an SBP of $\geq$140 mmHg;
in the European guidelines, ``Very high risk'' thresholds are $\geq$7.5\% for individuals 
aged $<$50 years and $\geq$10\% for individuals aged 50-69 years. 
Fourth, individuals deemed `High risk'' or lower were not pharmacologically treated unless
they had an LDL-C level of $\geq$5.0 mmol/L or a SBP of $\geq$160 mmHg
(varied to 3.0 mmol/L and 140 mmHg in scenario analyses; see below).
And fifth, individuals become ``Very high risk'' once they reached age 70 years and received both a high intensity statin and 
pharmacological treatment for hypertension if they had an SBP of $\geq$140 mmHg.
The standard of care scenario is represented schematically in Figure~\ref{Control_schematic}.

We selected the high intensity statin in this study to be atorvastatin 80 mg once daily, 
with an LDL-C reduction of 51.7\% (95\%CI: 51.2\%, 52.2\%) \cite{AdamsCDSR2015}.
Pharmacological therapy for lowering SBP was based on the 
most common medications used in the intensive arm of the SPRINT trial\cite{SPRINT2015} --
losartan 100 mg, chlortalidone 25 mg, and amlodipine 10 mg --
leading to a 20 mmHg ($\pm$25\%) reduction in SBP.
To match these clinical trials, we assumed conditions analagous to a 
clinical trial in the simulation
of interventions: people either received
treatment or they did not, and we assumed uptake and adherence was the same
as these clinical trials. 

The intervention scenario was identical to the standard of care scenario, except
individuals classified as ``High risk'' or lower after risk estimation with SCORE2
received immediate further testing for Lp(a) (Figure~\ref{Intervention_schematic}).
The result of this testing was to reclassify CVD risk based on Lp(a) levels --
people with an Lp(a) of at least 192 nmol/L (90 mg/dL) were 
reclassified into the ``Very high risk'' category and treated as per everyone else in this category
(i.e., a high intensity statin and 
pharmacological treatment for hypertension if they had an SBP of $\geq$140 mmHg).
Lp(a) testing only occurred once at the age the person first reaches threshold for testing.
In the control scenario, no Lp(a) testing occurred.


\subsection*{Health economic inputs}

The primary analysis was based on the Australian and UK
national healthcare systems and included both the healthcare and a societal perspective. 
All health economic inputs are shown in Supplementary Tables~\ref{heaegtabu} and ~\ref{heaegtabc}.

Utilities measure quality of life and usually 
range from 0 (death) to 1 (perfect health) \cite{EQ5D}. 
The utilities used in this study were derived 
from the EuroQol-five dimensions (EQ-5D) questionnaire\cite{EQ5D}
and a full explanation of their values and selection
is available in the Supplementary Methods. 
The utilities for people without diabetes or CVD in Australia
and the UK were derived from cross-sectional studies of the
general populations (Supplementary Figures~\ref{AgeUT}-\ref{AgeUTUK}) \cite{McCaffreyHQLO2016,ARAVIH2010}.
Utility values for each health state were derived from systematic reviews
and/or cohort studies (Supplementary Methods). 

All costs in the primary analysis were in 2023 Australian dollars (\$, hereafter) and 
Great British pounds (\textsterling, hereafter), 
inflated (when necessary) using the Health Price Index \cite{AUSHPI23} 
and NHS cost inflation index \cite{NHSinflation2023}, for Australia and the UK, respectively. 
A full explanation of all cost inputs and their selection
is available in the Supplementary Methods. 
Costs were derived preferentially from 
government costing reports and studies,
followed by large cohort studies. 
The once-off cost of an Lp(a) test was set at \$25
in Australia and \textsterling 40 in the UK. This cost included the full cost
to the healthcare system, not just the cost of the test itself. 
Indirect costs were estimated using the human capital approach (Supplementary Methods) \cite{VanARD2010}.
We included costs due to lost earnings due to absenteeism, workforce dropout due to
diabetes or CVD, and loss of future earnings due to death before retirement.


\subsection*{Outcomes}

The model estimated: the number of people who received an Lp(a) test and the number of people
who had their treatment modified in response to the Lp(a) test; the number of MIs, strokes, and deaths;
years of life lived and quality-adjusted life years (QALYs) in each health state;
the costs of Lp(a) testing; acute and chronic healthcare costs; and total indirect costs. 
The primary outcome was the incremental cost-effectiveness ratio (ICER), 
defined as the incremental healthcare costs divided by the incremental QALYs
comparing the Lp(a) testing intervention to standard of care. 

In the primary analysis, all health economic outcomes underwent discounting at 5\% in Australia and
3.5\% in the UK (per their respective guidelines \cite{PBACG,NICEHTA2013}), and results were compared to their
respective willingness-to-pay thresholds of \$28,000 per QALY gained in Australia \cite{EdneyPHEC2018}
and \textsterling 20,000 to \textsterling 30,000 per QALY in the UK \cite{NICEHTA2013}.
If ICERs were below these values but still produced costs, 
results were considered cost-effective; if incremental costs were negative,
the interventions were considered cost-saving. 
We stratified results by starting age group (40-49, 50-59, and 60-69) and sex. 


\subsection*{Cost adaptation analyses}

To provide an indication of the cost-effectiveness of Lp(a) testing in multiple other
high-income countries, we used a cost adaptation method based on that reported by Ademi et al. \cite{AdemiCA2018,MacEHJ2022}.
This method adapts all cost inputs to the model based on comparative
differences between countries in per-capita healthcare spending, 
purchasing power parity, and mean annual income. These data were all derived from
the Organization for Economic Cooperation and Development (OECD) \cite{OECDHS,OECDPPP,OECDAAW}.
We performed cost adaptation from both the healthcare system and societal perspectives for
Austria, Canada, France, Germany, Italy, the Netherlands, Spain, Poland, and the USA, using the UK as the reference.
The ICER derived through cost adaptation is only an estimation and does not represent the true ICER. 
It provides an approximate measure based on adjusted costs and assumptions, 
but it may not fully capture the actual cost-effectiveness in each country. 
These ICERs were compared to cost-effectiveness thresholds estimated by Pichon-Riviere et al. \cite{PRLGH2023}.


\subsection*{Sensitivity and scenario analyses}

Results with the assumptions above are considered the ``base case'' --
the most likely set of inputs. 

We conducted one-way sensitivity analyses by varying the model inputs between
the lower and upper bounds shown in Supplementary Tables~\ref{MRinputs}-\ref{heaegtabc}, 
presenting the results in Tornado diagrams. 
We conducted probabilistic sensitivity analyses using 500 Monte Carlo 
simulations based on the uncertainty in the model inputs. We used the probabilistic
sensitivity analysis to compute 95\% uncertainty intervals by taking the 2.5\textsuperscript{th}
and 97.5\textsuperscript{th} centiles of the simulation results. 

We also conducted nine scenario analyses. In the first three, we varied
the Lp(a) threshold at which treatment occurs from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL),
149 nmol/L (70 mg/dL), and 236 nmol/L (110 mg/dL), respectively. The remaining six,
and their results, are presented in the Supplementary Methods and Results. 

\clearpage
\section*{Results}

\subsection*{Overall}

The characteristics of the random sample for 10,000 people 
from UK Biobank used in the model are shown in Table~\ref{popcharMStab}.
The median LDL-C was 3.7 mmol/L (IQR: 3.2, 4.3) and SBP 138 mmHg (126, 153), and 7.1\% of the population
had an Lp(a) $\geq$192 nmol/L (90 mg/dL) (range 0-551 nmol/L). 

In the base case model, Lp(a) testing was performed on 8,993 of the 10,000 in the sample (Table~\ref{BCDtab}; 
the Lp(a) testing subset in Figure~\ref{Intervention_schematic}), and 624 (6.9\% of those tested) had their treatment
recommendations for other risk factors modified in response (i.e., they initiated a statin as well as 
blood pressure lowering therapy if indicated). Among the model
population, testing prevented 27 incident MIs, 4 incident strokes, and 11 deaths (Supplementary Figure~\ref{cumincf}).
This led to a gain in years of life lived of 60 in Australia and 78 in the UK 
and a gain in QALYs of 82 in Australia and 98 in the UK for the intervention compared to standard of care. 

Lp(a) testing and subsequent treatment changes from risk reclassification
saved \$1,119,226 and \textsterling 856,101 in healthcare costs for managing
CVD, while causing an increase of \$1,908,561 and \textsterling 167,572 in medication costs
and \$224,285 and \textsterling 359,720 in testing costs in Australia and the UK, respectively (Table~\ref{BCDtab}). 
Overall, this resulted in a net cost of approximately \$93 per person tested in Australia, whereas
testing was cost saving in the UK, 
saving approximately \textsterling 37 per person in the primary prevention population from a healthcare perspective. 
Lp(a) testing reduced indirect costs by approximately \$153 and \textsterling 74 per person,
resulting in a total cost saving from the societal perspective of \$60 and \textsterling 107 per person in Australia
and the UK, respectively. 

Lp(a) testing was cost-effective in Australia (ICER \$11,369 per QALY; under the
willingness-to-pay threshold of \$28,000 per QALY in Australia) and cost-saving (dominant; i.e., the 
intervention led to a gain in QALYs and was cost saving) in the UK 
compared to standard of care in the primary prevention population from a healthcare perspective,
and cost saving in both countries from the societal perspective. 

Age and sex stratified results are shown in Supplementary Tables~\ref{BCDtaba1a}-\ref{BCDtaba5u}.
From the healthcare perspective, Lp(a) testing was cost-effective in females and males 
in Australia (ICERs: \$27,035 and \$3,842 per QALY gained, respectively) and cost saving in the UK.
From the societal perspecitve, Lp(a) testing was cost-saving for females and males
in Australia and the UK. 


\subsection*{Cost adaptation analyses}

The results of the cost adaptation analysis are shown in Table~\ref{CAres}.
Lp(a) testing would be cost-saving from the healthcare perspective 
in all countries simulated, with ICERs ranging from $-$2,416 Euro (2023)
per QALY in Spain to $-$11,801 USD (2023) in the USA. Lp(a) testing was also cost-saving
from the societal perspective in all countries, with cost savings of 
up to 487 USD (2023) per person in the USA. 


\subsection*{Sensitivity and scenario analyses}

The results of the one-way sensitivity analyses are presented in Supplementary Figure~\ref{OSAfig}.
No individual input had a material impact on the conclusions about cost-effectiveness
in either Australia or the UK. 

The results of the probabilistic sensitivity analyses are presented in 
Figure~\ref{PSAfig} and Supplementary Table~\ref{PSAtab}. The intervention
led to a QALY gain in all simulations in both Australia and the UK.
From the healthcare perspective, 
the probability that Lp(a) testing was cost-effective and cost-saving
was 97\% and 2\% in Australia and 100\% and 81\% in the UK, respectively;
corresponding probabilities from the societal perspective were
99\% and 82\% in Australia and 100\% and 98\% in the UK. 

The results of the scenario analyses are shown in Supplementary Tables~\ref{BCDtabsce1a}-\ref{BCDtabsce7u}.
While the number of MIs and strokes prevented by risk reclassification 
increased with a decreasing threshold,
conclusions about ICERs and societal ICERs were unaffected by the Lp(a) threshold used for Australia
and for the UK when the threshold was 105 nmol/L (50 mg/dL) or 149 nmol/L (70 mg/dL), while when 
the threshold was changed to 236 nmol/L (110 mg/dL) Lp(a) testing was only cost-effective, 
not cost-saving, from the healthcare perspective. 
 

\clearpage
\section*{Discussion}

\subsection*{Main findings and interpretation}

We have shown that testing for Lp(a) is cost saving 
in the primary prevention population aged between 40 and 69 years
from the healthcare and societal perspectives in high-income countries,
offering significant value for improving health outcomes and optimising resource allocation
if implemented. 
This, while only a small minority of those tested (approximately 7\% in our sample) will have their treatment modified in response to testing,
because the benefits from preventing cardiovascular events by testing are still substantial owing to the high risk
of CVD among the population with high Lp(a). Nevertheless, in our scenario analyses in which we 
lowered the Lp(a) threshold at which treatment occurred (thereby treating a lower risk population), 
Lp(a) testing was still cost-effective while preventing more cardiovascular events.
These findings strongly support the implementation of Lp(a) testing as a preventative for CVD in 
the primary prevention populations across high income countries. 

Finding cost-effective strategies to improve the prevention of CVD is a public health priority
given that CVD remains a leading cause of morbidity and mortality worldwide \cite{RothJACC2020}. 
While pharmacological control of two of the major CVD risk factors -- LDL-C and SBP -- has become
a mainstay of CVD prevention, these medications come at a cost and have side effects, and thus 
a key issue has become effectively selecting people who will benefit from pharmacological treatments
to control risk factors when there is not an overt clinical need for the therapies, as in the primary
prevention population without markedly elevated LDL-C or SBP \cite{VisserenEHJ2021}.
Lp(a), as an important risk factor in a nontrivial minority ($\sim$5-10\%) of the population, has the potential
to be an important and cost-effective risk stratifier to address this critical clinical need, as shown by our findings.

However, despite calls from worldwide guidelines and society consensus 
statements for Lp(a) testing \cite{KronEHJ2022,NordLancet2024},
Lp(a) is not routinely measured in clinical practice in most countries.
One of the major reasons for this could be a prevailing opinion that
Lp(a) should not be measured when no medication to lower Lp(a) is available,
as reflected by a statement in the European guidelines for the prevention of CVD
that ``Lipoprotein(a) ... provides limited additional value 
in terms of reclassification potential'' \cite{VisserenEHJ2021}.
This misjudgement has been rejected by numerous scientific statements \cite{KronEHJ2022,NordLancet2024}
that recommend that other treatable risk factors should be treated more intensely
in people with elevated Lp(a). Our results support this notion and it is essential
the guidelines be updated to 
reflect the most up-to-date healthcare recommendations. 

The other reason Lp(a) has not been routinely measured in clinical practice in most countries may 
in part be due to the fact that the effectiveness and cost-effectiveness of Lp(a) testing had not yet 
been established -- no other published study to date has investigated the cost-effectiveness of testing for Lp(a),
with the exception of an unpublished abstract that indicated that Lp(a) testing was cost-effective
\cite{LPAABSTRACT}. Our work showing that Lp(a) testing is clinically warranted and cost-effective
is therefore a critical addition to the growing body of evidence
supporting the implementation of Lp(a) testing in clinical practice, even without a
registered medication for Lp(a)-lowering itself.

In the cost adaptation analysis we demonstrated that population-based Lp(a) testing has 
the potential to be a cost-effective  strategy in various healthcare systems. 
Specifically, the approach could be viable in countries such as Austria, Canada, France, Germany, 
Italy, Slovenia, Spain, the Netherlands, Poland and the US, based on their willingness-to-pay thresholds \cite{PRLGH2023}. 
However, the calculated ICERs should be viewed as approximate estimates rather than precise country-specific outcomes, 
as this evaluation does not account for parameters unique to individual healthcare systems. 

Our results were also robust to sensitivity and scenario analyses. 
In particular, when we incorporated the increased risk of diabetes
associated with statins\cite{ReithLDE2024} 
and when LDL-C or SBP lowering for all people not at 
very high CVD risk was initiated at a threshold
of 3.0 mmol/L or 140 mmHg, ICERs remained highly 
cost-effective in the UK for all three scenario analyses 
and were just above the willingness-to-pay threshold 
in Australia for the former two while improving for the latter. These represent
some of the most conservative assumptions we could have implemented, 
strengthening our conclusion that Lp(a) testing is cost-effective.

Thus, our results support widespread implementation of Lp(a) testing – a massive scaling up compared to current 
intermittent and sparse testing practices. We recommend that European governments
include Lp(a) testing as part of their national cardiovascular health 
plans that are currently in development \cite{ESCPR24}.

While beyond the scope of this work, 
it is worth noting that this scaling will present challenges, 
such as education of clinicians and patients, generating 
widespread Lp(a) testing capability and capacity, 
and ensuring that the scale-up does not exacerbate pre-existing health inequality. 
Nevertheless, scaling up will also have benefits we have not accounted for, such as 
economies of scale (for example, Lp(a) testing will become
much cheaper with a greater number of tests performed), 
aligning with the principle that people 
have the right to access important health information, implementation 
of more efficient screening strategies such as cascade screening,
and preparaing the screening infrastructure for when Lp(a) lowering
medications are clinically available. 


\subsection*{Strengths and limitations}

Strengths of this study include that the model was based on a large population and effects
of interventions on CVD were derived from Mendelian randomisation and lifetime risk factor
trajectories, thereby including the cumulative, causal effects of risk factors on CVD risk. 

Nevertheless, there are important limitations to the present study that warrant mention. First, the UK Biobank
study has a ``healthy volunteer'' bias \cite{FryAJE2017}, meaning the CVD and mortality
rates in the model may be underestimates. However, underestimating event risk would be conservative and
thus our estimates of benefits of Lp(a) testing are likely underestimates due to this limitation,
strengthening our conclusion that Lp(a) testing is likely cost-effective.
Second, the epidemiological structure of the model is not that of a randomised clinical trial, 
being based instead on causal data from Mendelian randomisation, 
meaning additional caution is required for interpretation of the results.

Third, the underlying event rates were all drawn from the UK and from a predominantly
white population, which may not be representative
of the breadth of countries for which results were presented in this analysis
or other non-white populations; nevertheless
the UK has a CVD mortality rate that is among the lowest in Europe \cite{TimLRH2023},
and non-white ethnicities have higher rates of CVD \cite{TimmisEHJ2022}, again
implying our results may underestimate the benefit of Lp(a) testing, except for countries
and ethnicities with significantly lower CVD rates. 
Similarly, we only included high-income countries; studies specific to low
and middle income countries will need to performed in the future.
Fourth, many of the model inputs and assumptions, 
particularly the Mendelian randomisation inputs, had
a high degree of uncertainty, 
although our results were robust to sensitivity analyses that would partly
account for this.

Fifth, the model only included MI and stroke as the two most common CVDs, 
while other less common CVDs (such as
peripheral artierial disease, aortic valve stenosis, and heart failure) 
would be impacted by Lp(a) testing,
again implying our results may underestimate the benefits of Lp(a) testing. 
Sixth, because the SCORE-2 algorithm and, thus, current guidelines
essentially only recommend pharmacological primary prevention of CVD
from age 40 years, our starting population did not include people below this age. 
It is thus unclear whether Lp(a) testing would be cost-effective
at a younger age, although cost effectiveness was greater at younger ages
in the present study and earlier reclassification of risk and treatment
with statins would lower the lifetime risk of cardiovascular events \cite{MortonPECA2023}.
Further studies are needed to determine the cost-effectiveness of Lp(a) testing at younger ages,
particularly in an attempt to detect people with very high Lp(a) that may be at risk
of a very early onset of CVD. 

Sixth, we imputed Lp(a) values for a subset of the sample with missing Lp(a), although
we have previously shown this imputation is accurate and inconsequential
for the purposes of our modelling approach \cite{MortonVIH2024}. 
Seventh, modelling necessitates a loss of clinical nuance in the treatment of 
individuals in the model and reduces clinical practice to rigid practice points and assumptions. 
Indeed, we did not simulate lifestyle interventions as these are highly
individual-specific and would be offered to people regardless of cardiovascular risk,
although they may be intensified in people with high Lp(a), which is an
area for future study. 
We endeavored to make conservative assumptions
about treatment practices to strengthen the conclusions about cost-effectiveness. 
Finally, we did not include treatment side-effects in this study as these are rare \cite{SPRINT2015,CTTLancet2022}
or a disutility associated with pill taking as it is insignificant \cite{HutchBMJO2015}.


\subsection*{Conclusion}

Lp(a) testing to reclassify CVD risk in the primary prevention population aged between 40 and 69 years
is a highly cost-effective way to prevent CVD. Implementation of Lp(a) testing 
is not only highly warranted from a clinical perspective, but is likely to come
with a financial return on investment within a relatively short time when considered
from the societal perspective. Our results support the immediate implementation
of Lp(a) testing in primary prevention populations high income countries. 


\clearpage
\section*{Acknowledgements}

This research has been conducted using the UK Biobank Resource under 
Application Number 88775. This study used linked data from 
NHS England. Copyright (2023), NHS England. 
Re-used with the permission of the NHS England [and/or UK Biobank]. 
All rights reserved. This research used data assets made available by 
National Safe Haven as part of the Data and Connectivity National Core Study, 
led by Health Data Research UK in partnership with the Office for 
National Statistics and funded by UK Research and Innovation. 
KKR acknowledges the support of the Imperial NIHR Biomedical Research Centre. 
\textbf{Disclaimer:} These are the personal opinions of the authors and do not 
necessarily represent the views or endorsement of the their academic institutions or organization.

\subsection*{Funding}

This study was commissioned and funded by FH Europe Foundation, as part of the Lp(a) International Taskforce (ITF) initiative. 
The funder had no input into the design of the study or decision to submit for publication.
ZA and JIM were supported by the National Health and Medical Research Council Ideas Grants Application ID: 2012582.
JIM was supported by a Heart Foundation Postdoctoral Fellowship (ID: 108269-2024) 
from the National Heart Foundation of Australia.

\subsection*{Duality of Interest} 

FK has received honoraria for consulting or speaker activities from Novartis, 
Amgen, Silence Therapeutics and Roche. 
RDS has received honoraria related to consulting, speaker activities, 
and or research from Aché, Amgen, Amryt, Chiesi, Daiichi-Sankyo, 
Eli-Lilly, Esperion, Ionis, MSD, Novo-Nordisk, Novartis, 
PTC Therapeutics, Sanofi/Regeneron, Torrent, and Ultragenyx. 
TS has participated in an advisory board for Silence Therapeutics. 
GFW has received honoraria related to consulting, 
speaker activities, and or research from  Amgen, 
Arrowhead, CSL Sequirus, Esperion, Ionis, Novo-Nordisk, Novartis, Sanofi/Regeneron.  
SJN has received research support from AstraZeneca, 
Amgen, Anthera, CSL Behring, Cerenis, Cyclarity, Eli Lilly, 
Esperion, Resverlogix, New Amsterdam Pharma, Novartis, InfraReDx and 
Sanofi-Regeneron and is also a consultant for Amgen, Akcea, AstraZeneca, 
Boehringer Ingelheim, CSL Behring, Eli Lilly, Esperion, Kowa, Merck, 
Takeda, Pfizer, Sanofi- Regeneron, Vaxxinity, CSL Sequiris and Novo Nordisk.
BGN report consultancies/talks for AstraZeneca, Sanofi, 
Amgen, Amarin, Novartis, Novo Nordisk, Esperion, Abbott, Lilly, Arrowhead, and Marea.
KKR has received research grants from Amarin, 
Amgen, Daiichi Sankyo, Merck Sharp \& Dohme, Pfizer, 
Regeneron, and Sanofi, and is consultant for Abbott, 
Amarin, Amgen, AstraZeneca, Bayer, Biologix, Boehringer Ingelheim, 
Cargene Therapeutics, CRISPR, CSL Behring, Eli Lilly and Company, Esperion, Kowa Pharmaceuticals, 
NewAmsterdam Pharma, Novartis, Novo Nordisk, Pfizer, Regeneron, Resverlogix, Sanofi, 
Scribe Therapeutics, Silence Therapeutics, Vaxxinity, and Viatris, honoraria for 
lectures from Amarin, Amgen, Astra Zeneca, Biologix Pharma, Boehringer Ingelheim, 
Daiichi Sankyo, Esperion, Macleod, Novartis, Novo Nordisk, Sanofi, and Viatris, and 
stock options from New Amsterdam Pharma, Pemi 31, and SCRIBE Therapeutics.
PRK has received lecture honoraria or consultancy fees from Physicians Academy 
for Cardiovascular Education, Novartis, Silence Therapeutics, Eli Lilly, and Amgen.

\subsection*{Author Contributions}

JIM designed and constructed the model, 
performed the analysis and 
literature search, wrote the protocol,  
wrote the first draft of the manuscript, revised the manuscript,
contributed to study design, 
and contributed to acquisition and 
interpretation of data. 
JIM is the guarantor of this work and, as such, 
had full access to all the data in the study and takes responsibility 
for the integrity of the data and the accuracy of the data analysis. 
ZA is senior author and obtained funding, contributed to study design,
design of the model, acquisition and interpretation of data, 
writing and revision of the manuscript, and supervision. All other authors 
contributed to study design, interpretation of data, and 
revision of the manuscript. All authors read and approved 
the final manuscript and JIM and ZA had final responsibility for 
the decision to submit for publication. 

\subsection*{Data availability}

Data from the UK Biobank study was used for this study. 
The dataset is accessible to researchers via https://www.ukbiobank.ac.uk/register-apply/ 

\subsection*{Patient and Public Involvement}

Patients and advocates were actively involved in the research through FH Europe Foundation.
Patients with elevated Lp(a) contributed from the outset as part of the Lp(a) International Taskforce (ITF), 
participating in online and in-person meetings, including the ITF meeting during the ESC Congress (Amsterdam, 2023) 
and the ITF meeting during the EAS Congress (Lyon, 2024). 
A broader patient community was informed during the FH Europe Foundation 
Annual Network Meeting (Amsterdam, 2023).


\clearpage
\begin{landscape}
\section*{Tables and Figures}

\begin{table}[h!]
  \begin{center}
    \caption{Baseline characteristics for the model starting population.}
    \label{popcharMStab}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=, column type={l}, text indicator="},
      display columns/1/.style={column name=Females, column type={r}},
      display columns/2/.style={column name=Males, column type={r}},
      display columns/3/.style={column name=Overall, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/popchar_MS.csv}
  \end{center}
Numeric variables are presented as median (25th centile, 75th centile; minimum, maximum). \\
Abbreviations: 
LDL-C -- Low density lipoprotein-cholesterol; 
Lp(a) -- Lipoprotein(a); 
SBP -- Systolic blood pressure;
LSI -- Lifetime smoking index.
\end{table}
\end{landscape}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results for Lp(a) testing (intervention) compared to standard of care (control). 
Full results are shown Supplementary Tables ~\ref{BCDtabfa} and ~\ref{BCDtabfu}.}
    \label{BCDtab}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
		every row no 8/.style={before row=\hline},
		every row no 19/.style={before row=\hline},
    ]{CSV/BCrestabsumpaper.csv}
  \end{center}
The willingness-to-pay threshold was \$28,000 per QALY gained in Australia \cite{EdneyPHEC2018}
and \textsterling 20,000 to \textsterling 30,000 per QALY in the UK \cite{NICEHTA2013}. \\
\noindent Abbreviations: 
MI -- Myocardial infarction;
YLL -- Years of life lived;
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}
\clearpage


\clearpage
\thispagestyle{empty}
\begin{table}[h!]
  \begin{center}
	\vspace*{-1cm}
    \caption{Cost adaptation results.}
    \label{CAres}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
        every nth row={5}{before row=\midrule},
    ]{CSV/CAres.csv}
  \end{center}
Abbreviations: 
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}


\clearpage
\begin{landscape}
\begin{figure}[h!]
    \centering
    \caption{Schematic of the control scenario.}
    \includegraphics[width=1.4\textwidth]{Control.pdf}
    \label{Control_schematic}
\end{figure}
\clearpage
\begin{figure}[h!]
    \centering
    \caption{Schematic of the intervention scenario.}
    \includegraphics[width=1.4\textwidth]{Intervention.pdf}
    \label{Intervention_schematic}
\end{figure}
\end{landscape}

\clearpage
***/

texdoc stlog, nolog
graph combine ///
GPH/PSA_1.gph ///
GPH/PSA_2.gph ///
GPH/PSAS_1.gph ///
GPH/PSAS_2.gph ///
, graphregion(color(white)) cols(2) xsize(5) altshrink
texdoc graph, label(PSAfig) figure(h!) fontface("Liberation Sans") ///
caption(Results of the probabilistic sensitivity analysis for Lp(a) testing (intervention) compared to standard of care (control) ///
in a common cost-effectiveness plane for each country.)
texdoc stlog close


/***


\clearpage
\section*{References}
\bibliography{Library/Library.bib}
\end{document}

***/

texdoc close


texdoc init LPA_MS2_A, replace logdir(LPA_MS2_A_dir) gropts(optargs(width=0.8\textwidth))
set linesize 100

/***
\documentclass[11pt]{article}
\usepackage{fullpage}
\usepackage{siunitx}
\usepackage{hyperref,graphicx,booktabs,dcolumn}
\usepackage{stata}
\usepackage[x11names]{xcolor}
\usepackage{natbib}
\usepackage{chngcntr}
\usepackage{pgfplotstable}
\usepackage{pdflscape}
\usepackage{amssymb}
\usepackage{multirow}
\usepackage{booktabs}
\usepackage[section]{placeins}

\newcommand{\specialcell}[2][c]{%
  \begin{tabular}[#1]{@{}l@{}}#2\end{tabular}}

\newcommand{\specialcelr}[2][c]{%
  \begin{tabular}[#1]{@{}r@{}}#2\end{tabular}}

\usepackage[superscript,biblabel]{cite}

\renewcommand{\figurename}{Supplementary Figure}
\renewcommand{\tablename}{Supplementary Table}

\newcommand{\thedate}{\today}

\bibliographystyle{unsrt}
\renewcommand{\bibsection}{}
\makeatletter
\renewcommand\@biblabel[1]{	#1.}
\makeatother

\begin{document}

\begin{titlepage}
    \begin{flushright}
        \Huge
        \textbf{
Lp(a) testing and treatment with olpasiran for the primary and secondary prevention of 
cardiovascular disease in high income countries: a cost-effectiveness analysis
}
\rule{16cm}{2mm} \\
\Large
Appendix \\
\thedate \\
       \vfill
    \end{flushright}
        \Large


\noindent
Jedidiah I Morton, PhD,\footnote{\label{HEPER}Health Economics and Policy Evaluation Research (HEPER) Group, Centre for Medicine Use and Safety, Faculty of Pharmacy and Pharmaceutical Sciences, Monash University, Melbourne, Australia}\textsuperscript{,}\footnote{Diabetes and Population Health, Baker Heart and Diabetes Institute, Melbourne, Australia}
Florian Kronenberg, PhD,\footnote{Institute of Genetic Epidemiology, Medical University of Innsbruck, Innsbruck, Austria}
[Any other authors from the Lp(a) taskforce], 
Zanfina Ademi, PhD.\textsuperscript{\ref{HEPER},}\footnote{School of Public Health and Preventive Medicine, Monash University, Melbourne, Australia}\footnote{Central Clinical School, Monash University, Melbourne, Australia}\footnote{School of Pharmacy, University of Eastern Finland, Kuopio, Finland} \\
 \\
\noindent
Correspondence to: \\
Jedidiah Morton;  
\color{blue}
\href{mailto:Jedidiah.Morton@Monash.edu}{Jedidiah.Morton@monash.edu} \\ 
\color{black}
\noindent
Zanfina Ademi; 
\color{blue}
\href{mailto:Zanfina.Ademi@Monash.edu}{Zanfina.Ademi@monash.edu} \\ 
\color{black}

\end{titlepage}

\clearpage
\listoftables
\clearpage
\listoffigures
\clearpage


\begin{landscape}
\thispagestyle{empty}

\begin{table}[h!]
\centering
    \caption{Mendelian randomisation estimates of associations between risk factors and myocardial infarction,
stroke, and death from various causes.}
	\hspace*{-1cm}
    \label{MRinputs}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{lllll}
\hline
Input & Value & Distribution & Source \\
\hline
LDL-C on incident MI & 2.083 (2.000, 2.222) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{FerenceJAMA2019} \\
Lp(a) on incident and recurrent MI & 1.0054 (1.0045, 1.0062) per 1 mg/dL increase in lifetime Lp(a) & Log-normal & \cite{LaminaJAMAC2019} \\
SBP on incident MI & 1.058 (1.051, 1.064) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{FerenceJAMA2019} \\
Smoking on incident MI & 1.43 (1.22, 1.62) per 1 unit increase in the LSI & Log-normal & \cite{LevinJAMANO2021} \\
Diabetes on incident MI & 1.26 (1.08, 1.40) for diabetes vs. no diabetes & Log-normal & \cite{RossEHJ2015} \\
LDL-C on incident IS & 1.08 (1.03, 1.14) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{YuanAN2020} \\
Lp(a) on incident IS and recurrent stroke & 1.0035 (1.0023, 1.0045) per 1 mg/dL increase in lifetime Lp(a) & Log-normal & \cite{LarssonCirc2020} \\
SBP on incident IS & 1.027 (1.018, 1.037) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{WanHyp2021} \\
Smoking on incident IS & 1.33 (1.22, 1.46) per 1 unit increase in the LSI & Log-normal & \cite{LarssonAN2019} \\
Type 2 diabetes on incident IS & 1.74 (1.19, 2.47) for diabetes vs. no diabetes & Log-normal & \cite{GanDC2019} \\
SBP on incidence ICH & 1.039 (1.010, 1.069) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{WanHyp2021} \\
Smoking on incident type 2 diabetes & 1.21 (1.03, 1.41) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from bladder cancer & 2.52 (1.66, 3.81) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from colorectal cancer & 1.24 (1.06, 1.44) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from oesophageal cancer & 3.67 (1.67, 8.02) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from kidney cancer & 1.69 (1.04, 3.05) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from lung cancer & 13.64 (8.85, 21.03) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from ovarian cancer & 1.27 (1.04, 1.57) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
Smoking on death from pancreatic cancer & 2.13 (1.15, 3.90) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
SBP on death from Pneumonia & 1.016 (1.008, 1.025) per 1 mmHg increase in lifetime SBP & Log-normal & \cite{ZekavatMed2021} \\
Smoking on death from Pneumonia & 4.03 (3.16, 5.11) per 1 unit increase in the LSI & Log-normal & \cite{FlatbyCMI2022} \\
Smoking on death from COPD & 13.64 (8.85, 21.03) per 1 unit increase in the LSI & Log-normal & Inferred based on \cite{LarssonEBM2022,KingECM2020} \\
LDL-C on death from ALS & 1.09 (1.03, 1.14) per 1 mmol/L increase in lifetime LDL-C & Log-normal & \cite{ZengHMG2019} \\
Smoking on death from Parkinson's disease & 0.48 (0.27, 1.01) per 1 unit increase in the LSI & Log-normal & \cite{LarssonEBM2022} \\
\hline
\end{tabular}
Abbreviations: 
LDL-C -- Low-density lipoprotein-cholesterol; 
MI -- Myocardial infarction; 
SBP -- Systolic blood pressure; 
Lp(a) -- Lipoprotein(a);
IS -- Ischaemic stroke;
ICH -- Intracerebral haemorrhage;
COPD -- chronic obstructive pulmonary disease;
ALS -- amyotrophic lateral sclerosis.
\end{table}

\clearpage
\thispagestyle{empty}
\begin{table}[h!]
\centering
    \caption{Epidemiological model inputs}
	\hspace*{-2cm}
    \label{Einputs}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{llll}
\hline
Input & Value & Distribution & Source \\
\hline
Transition probabilities & See Supplementary Figures~\ref{CVinc}-\ref{t2dincgph} & Log-normal & UK Biobank and \cite{PalBMJODRC2021} \\
Risk factor levels & See protocol & Normal and log-normal & UK Biobank \\
Effects of risk factors on outcomes & See Supplementary Table~\ref{MRinputs} & log-normal & Various \\
Effect of atorvastatin 80 mg & 51.7\% (51.2, 52.2) LDL-C reduction & Normal & \cite{AdamsCDSR2015} \\
Effect of losartan 100 mg, chlortalidone 25 mg, and amlodipine 10 mg & 20 mmHg ($\pm$ 25\%) SBP reduction & Normal & \cite{SPRINT2015} \\
\hline
\end{tabular}
*Scenario analysis only. \\
Abbreviations: 
LDL-C -- Low-density lipoprotein-cholesterol; 
MI -- Myocardial infarction; 
SBP -- Systolic blood pressure; 
Lp(a) -- Lipoprotein(a);
IS -- Ischaemic stroke;
ICH -- Intracerebral haemorrhage;
COPD -- chronic obstructive pulmonary disease;
ALS -- amyotrophic lateral sclerosis.
\end{table}




\clearpage
\thispagestyle{empty}
\begin{table}[h!]
\centering
    \caption{Model inputs -- utilities}
	\hspace*{-2cm}
    \label{heaegtabu}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{lllll}
\hline
Category & Input & Value & Distribution & Source \\
\hline
\multirow{10}{*}{Utilities}
& Utility for no CVD or diabetes in Australia & Age and sex-specific (see Supplementary Figure~\ref{AgeUT}) & Beta & \cite{McCaffreyHQLO2016} \\
& Utility for no CVD or diabetes in the UK & Age and sex-specific ($\pm$ 5\%; see Supplementary Figure~\ref{AgeUTUK}) & Beta & \cite{ARAVIH2010} \\
& Chronic utility for diabetes & 0.785 (0.681, 0.889) & Beta & \cite{BeaudetVIH2014} \\
& Chronic utility for MI & 0.79 (0.73, 0.85) & Beta & \cite{BettsHQLO2020} \\
& Chronic utility for stroke &  0.65 (0.63, 0.67) & Beta & \cite{JoundiJAHA2022} \\
& Chronic utility for MI and stroke &  0.65 (0.63, 0.67) & Beta & \cite{JoundiJAHA2022} \\
& Chronic disutility for MI in diabetes & -0.055 (-0.067, -0.042) & Normal & \cite{BeaudetVIH2014} \\
& Chronic disutility for stroke in diabetes & -0.164 (-0.222, -0.105) & Normal & \cite{BeaudetVIH2014} \\
& Chronic disutility for MI and stroke in diabetes & -0.164 (-0.222, -0.105) & Normal & \cite{BeaudetVIH2014} \\
& Acute disutility for MI & -0.01125 ($\pm$ 20\%) & Normal & \cite{LaceyEJCN2004} \\
& Acute disutility for stroke & -0.03 ($\pm$ 20\%) & Normal & \cite{JoundiJAHA2022} \\
\hline
\end{tabular} \\
Abbreviations: 
MI -- Myocardial infarction.
\end{table}



\clearpage
\thispagestyle{empty}
\begin{table}[h!]
\centering
	\vspace*{-2cm}
    \caption{Model inputs -- costs}
	\hspace*{-3cm}
    \label{heaegtabc}
\fontsize{9pt}{11pt}\selectfont\begin{tabular}{lllll}
\hline
Category & Input & Value & Distribution & Source \\
\hline
\multirow{17}{*}{\specialcell{Direct healthcare costs -- \\ Australia}} 
& Chronic cost of diabetes & \$3,588 (2,816, 4539) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Chronic cost of MI & \$6,222 ($\pm$10\%) & Gamma & \cite{MarquinaEJPC2022,CobiacBMCPH2012} \\
& Chronic cost of stroke & \$4,388 ($\pm$10\%) & Gamma & \cite{MarquinaEJPC2022,CobiacBMCPH2012} \\
& Chronic cost of MI and stroke & \$6,222 ($\pm$10\%) & Gamma & \cite{MarquinaEJPC2022,CobiacBMCPH2012} \\
& Chronic cost of MI among people with diabetes & \$8,870 (6,804, 10,937) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Chronic cost of stroke among people with diabetes & \$8,870 (6,804; 10,937) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Chronic cost of MI and stroke among people with diabetes & \$8,870 (6,804; 10,937) & Gamma & \cite{MortonDLOGIA2023,LeeDRCP2013} \\
& Acute cost of non-fatal MI & \$14,434 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Acute cost of non-fatal stroke & \$15,659 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Acute cost of fatal MI & \$3,363 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Acute cost of fatal stroke & \$13,154 ($\pm$10\%) & Gamma & \cite{MortonDLOGIA2023} \\
& Lp(a) test cost & \$25 & Fixed & Current cost \\
& Annual cost of atorvastatin 80 mg & \$200 & Fixed & \cite{PBSDOS23} \\
& Annual cost of losartan 100 mg & \$200 & Fixed & \cite{PBSDOS23} \\
& Annual cost of chlortalidone 25 mg & \$143 & Fixed & \cite{PBSDOS23} \\
& Annual cost of amlodipine 10 mg & \$212 & Fixed & \cite{PBSDOS23} \\
& Annual cost of olpasiran 225 mg & \$4,360 & Fixed & Assumption \\
\hline
\multirow{17}{*}{Direct healthcare costs -- UK} 
& Chronic cost of diabetes & \textsterling 2,546 (2,462, 2,633) in females; 
\textsterling 2,170 (2,090, 2,254) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI & \textsterling 3,304 (3,026, 3,607) in females; 
\textsterling 2,917 (2,701, 3,149) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of stroke & \textsterling 7,021 (5,852, 8,421) in females; 
\textsterling 7,351 (5,923, 8,062) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI and stroke & \textsterling 14,442 (9,929, 21,004) in females; 
\textsterling 12,616 (8,484, 18,756) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI in diabetes & \textsterling 4,511 (3,947, 5,155) in females; 
\textsterling 3,917 (3,480, 4,409) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of stroke in diabetes & \textsterling 10,014 (7,615, 13,167) in females; 
\textsterling 10,494 (7,701, 14,300) in males & Gamma & \cite{PHEcosts2020} \\
& Chronic cost of MI and stroke in diabetes & \textsterling 14,442 (9,929, 21,004) in females; 
\textsterling 12,616 (8,484, 18,756) in males & Gamma & \cite{PHEcosts2020} \\
& Acute cost of non-fatal MI & \textsterling 2,212 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Acute cost of non-fatal stroke & \textsterling 4,626 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Acute cost of fatal MI & \textsterling 515 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Acute cost of fatal stroke & \textsterling 3,886 ($\pm$10\%) & Gamma & \cite{NHSCOST202122} \\
& Lp(a) test cost & \textsterling 40 & Fixed & Assumption \\
& Annual cost of atorvastatin 80 mg & \textsterling 18.00 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of losartan 100 mg & \textsterling 15.91 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of chlortalidone 25 mg & \textsterling 12.42 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of amlodipine 10 mg & \textsterling 9.91 & Fixed & \cite{NHSDrugTariff062023} \\
& Annual cost of olpasiran 225 mg & \textsterling 3,975 & Fixed & Assumption \\
\hline
\multirow{12}{*}{Indirect cost inputs} 
& Retirement age  -- Australia & 67 years & Fixed & Policy \\
& Retirement age  -- UK & 66 years & Fixed & Policy \\
& Average annual earnings -- Australia & \$73,003 & Fixed & \cite{ABSWeeklyEarnings} \\
& Average annual earnings -- UK & \textsterling 34,855 & Fixed & \cite{ONSWeeklyEarnings} \\
& Employment rates & Age and sex-specific & Fixed & \cite{ABSEmployment,ONSEmployment} \\
& Acute absenteeism for MI & 55 days ($\pm$20\%) & Normal & \cite{WorcHLC2014} \\
& Acute absenteeism for stroke & 90 days ($\pm$20\%) & Normal & \cite{RadfordJRM2020} \\
& Chronic absenteeism for CVD & 21.5 days annually ($\pm$20\%) & Normal & \cite{AIHWCDPW} \\
& Chronic absenteeism for diabetes & 6 days annually (2-10) & Normal & \cite{BretonDC2013} \\
& Workforce non-participation ratio for MI & 1.46 (1.36, 1.55) & Log-normal & \cite{BinPlos2021} \\
& Workforce non-participation ratio for stroke & 1.92 (1.80, 2.06) & Log-normal & \cite{BinPlos2021} \\
& Workforce non-participation reduction for diabetes & Age and sex-specific & Fixed & \cite{ZhangJHE2009} \\
\hline
\end{tabular}
Abbreviations: 
MI -- Myocardial infarction.
\end{table}
\end{landscape}

\clearpage



\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, females.  Australia.}
    \label{ABCDtab2ppa1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_1_1.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, males. Australia.}
    \label{ABCDtab2ppa2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_2_1.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 40-49 at baseline. Australia.}
    \label{ABCDtab2ppa3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_3_1.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 50-59 at baseline. Australia.}
    \label{ABCDtab2ppa4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_4_1.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 60-69 at baseline. Australia.}
    \label{ABCDtab2ppa5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_5_1.csv}
  \end{center}
\end{table}



\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, females. UK.}
    \label{UBCDtab2ppa1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_1_2.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, males. UK.}
    \label{UBCDtab2ppa2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_2_2.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 40-49 at baseline. UK.}
    \label{UBCDtab2ppa3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_3_2.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 50-59 at baseline. UK.}
    \label{UBCDtab2ppa4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_4_2.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Primary prevention population, people aged 60-69 at baseline. UK.}
    \label{UBCDtab2ppa5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsum2_5_2.csv}
  \end{center}
\end{table}


\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, females. Australia.}
    \label{ABCDtab2spa1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_1_1.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, males. Australia.}
    \label{ABCDtab2spa2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_2_1.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 40-49 at baseline. Australia.}
    \label{ABCDtab2spa3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_3_1.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 50-59 at baseline. Australia.}
    \label{ABCDtab2spa4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_4_1.csv}
  \end{center}
\end{table}


\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 60-69 at baseline. Australia.}
    \label{ABCDtab2spa5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_5_1.csv}
  \end{center}
\end{table}



\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, females. UK.}
    \label{UBCDtab2spa1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_1_2.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, males. UK.}
    \label{UBCDtab2spa2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_2_2.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 40-49 at baseline. UK.}
    \label{UBCDtab2spa3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_3_2.csv}
  \end{center}
\end{table}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 50-59 at baseline. UK.}
    \label{UBCDtab2spa4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_4_2.csv}
  \end{center}
\end{table}


\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population, people aged 60-69 at baseline. UK.}
    \label{UBCDtab2spa5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabspsum_5_2.csv}
  \end{center}
\end{table}

\clearpage
\thispagestyle{empty}
\begin{table}[h!]
  \begin{center}
	\vspace*{-1cm}
    \caption{Cost adaptation results. Primary prevention population.}
    \label{CArespp}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
        every nth row={5}{before row=\midrule},
    ]{CSV/CAres2.csv}
  \end{center}
Abbreviations: 
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}

\clearpage
\begin{table}[h!]
\centering
    \caption{PSA results placeholder table.}
    \label{PSAtab2}
	\begin{tabular}{lllll}
\hline
1 & 3 & 1 & 2 \\
1 & 3 & 1 & 2 \\
1 & 3 & 1 & 2 \\
1 & 3 & 1 & 2 \\
\hline
\end{tabular}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 1:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). Australia.}
    \label{ABCDtab2ppsce1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_1_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Scenario 1:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). Australia.}
    \label{ABCDtab22psce1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_1_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 2:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). Australia.}
    \label{ABCDtab2ppsce2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_2_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Scenario 2:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). Australia.}
    \label{ABCDtab2spsce2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_2_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 3:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). Australia.}
    \label{ABCDtab2ppsce3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_3_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Scenario 3:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). Australia.}
    \label{ABCDtab2spsce3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_3_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 4:  LDL-C lowering with statins causes diabetes. Australia.}
    \label{ABCDtab2ppsce4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_4_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 5: 0\% discounting. Australia.}
    \label{ABCDtab2ppsce5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_5_1.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Scenario 5: 0\% discounting. Australia.}
    \label{ABCDtab2spsce5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_5_1.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 1:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). UK.}
    \label{UBCDtab2ppsce1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_1_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Scenario 1:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL). UK.}
    \label{UBCDtab22psce1}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_1_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 2:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). UK.}
    \label{UBCDtab2ppsce2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_2_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Scenario 2:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 149 nmol/L (70 mg/dL). UK.}
    \label{UBCDtab2spsce2}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_2_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 3:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). UK.}
    \label{UBCDtab2ppsce3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_3_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Scenario 3:  Lp(a) threshold for treatment varied from 192 nmol/L (90 mg/dL) to 236 nmol/L (110 mg/dL). UK.}
    \label{UBCDtab2spsce3}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_3_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 4:  LDL-C lowering with statins causes diabetes. UK.}
    \label{UBCDtab2ppsce4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_4_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Scenario 4:  LDL-C lowering with statins causes diabetes. UK.}
    \label{UBCDtab2spsce4}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_4_2.csv}
  \end{center}
\end{table}


\begin{table}[h!]
  \begin{center}
    \caption{Scenario analysis results, summary. Primary prevention population. Scenario 5: 0\% discounting. UK.}
    \label{UBCDtab2ppsce5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabsum2_5_2.csv}
  \end{center}
\end{table}

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, summary. Secondary prevention population. Scenario 5: 0\% discounting. UK.}
    \label{UBCDtab2spsce5}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/SCErestabspsum_5_2.csv}
  \end{center}
\end{table}

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Primary prevention population. Australia.}
    \label{BCDtab2ppfa}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestab2_1.csv}
  \end{center}
\end{table}


\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Secondary prevention population. Australia.}
    \label{BCDtab2spfa}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsp_1.csv}
  \end{center}
\end{table}
\clearpage


\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Primary prevention population. UK.}
    \label{BCDtab2ppfu}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestab2_2.csv}
  \end{center}
\end{table}

\clearpage

\begin{table}[h!]
  \begin{center}
    \caption{Base case results, detailed. Secondary prevention population. UK.}
    \label{BCDtab2spfu}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/1/.style={column name=Control, column type={r}},
      display columns/2/.style={column name=Intervention, column type={r}},
      display columns/3/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
    ]{CSV/BCrestabsp_2.csv}
  \end{center}
\end{table}


\clearpage
\begin{figure}[h!]
    \centering
    \caption{Model structure. Repeat events can occur, but do not involve state transitions. 
Abbreviation -- MI: Myocardial infarction.}
    \includegraphics[width=1\textwidth]{Structure.pdf}
    \label{Schematic}
\end{figure}

***/

texdoc stlog, nolog
graph combine ///
GPH/asr_nfMI.gph ///
GPH/asr_fMI.gph ///
GPH/asr_nfIS.gph ///
GPH/asr_fIS.gph ///
GPH/asr_nfICH.gph ///
GPH/asr_fICH.gph ///
, graphregion(color(white)) altshrink cols(2) xsize(4)
texdoc graph, label(CVinc) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific incidence of CVD, by CVD type.)
graph combine ///
GPH/asr_oescdeath.gph ///
GPH/asr_colcdeath.gph ///
GPH/asr_pancdeath.gph ///
GPH/asr_luncdeath.gph ///
GPH/asr_ovacdeath.gph ///
GPH/asr_kidcdeath.gph ///
GPH/asr_blacdeath.gph ///
GPH/asr_pneudeath.gph ///
GPH/asr_copddeath.gph ///
GPH/asr_alsdeath.gph ///
GPH/asr_pddeath.gph ///
GPH/asr_otherdeath.gph ///
, graphregion(color(white)) altshrink cols(3) xsize(4)
texdoc graph, label(codmr) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific mortality rate, by cause of death. ///
Other causes includes all other causes except CHD, IS, and ICH. \\ ///
Abbreviations: COPD -- Chronic obstructive pulmonary disease; ///
ALS -- amyotrophic lateral sclerosis.)
graph combine ///
GPH/pevasr_nfMI_1.gph ///
GPH/pevasr_nfMI_2.gph ///
GPH/pevasr_nfMI_3.gph ///
GPH/pevasr_fMI_1.gph ///
GPH/pevasr_fMI_2.gph ///
GPH/pevasr_fMI_3.gph ///
GPH/pevasr_nfS_1.gph ///
GPH/pevasr_nfS_2.gph ///
GPH/pevasr_nfS_3.gph ///
GPH/pevasr_fS_1.gph ///
GPH/pevasr_fS_2.gph ///
GPH/pevasr_fS_3.gph ///
GPH/pevasr_othd_1.gph ///
GPH/pevasr_othd_2.gph ///
GPH/pevasr_othd_3.gph ///
, graphregion(color(white)) altshrink cols(3) xsize(4)
texdoc graph, label(CVincpev) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific incidence of recurrent CVD or death, by CVD type and starting health state.)
clear
append using INC/t2d_0 INC/t2d_1
replace rate = rate*1000
gen lb = exp(ln(rate)-1.96*errr)
gen ub = exp(ln(rate)+1.96*errr)
twoway ///
(rarea ub lb age if sex == 0, color(red%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 0, color(red) lpattern(solid)) ///
(rarea ub lb age if sex == 1, color(blue%30) fintensity(inten80) lwidth(none)) ///
(line rate age if sex == 1, color(blue) lpattern(solid)) ///
, legend(symxsize(0.13cm) position(11) ring(0) region(lcolor(white) color(none)) ///
order(4 "Males" ///
2 "Females") ///
cols(1)) yscale(nolog range(0 15)) ///
graphregion(color(white)) ///
ylabel(0(3)15, angle(0) format(%9.0f)) ///
xlabel(30(10)80, nogrid) ///
ytitle("Incidence rate (per 1,000 person-years)") ///
xtitle("Age (years)")
texdoc graph, label(t2dincgph) figure(h!) cabove fontface("Liberation Sans") ///
caption(Age- and sex-specific incidence of type 2 diabetes in the UK.)
texdoc stlog close

/***

\clearpage
\begin{landscape}
\begin{figure}[h!]
    \centering
    \caption{Schematic of the control scenario.}
    \includegraphics[width=1.4\textwidth]{Control_2.pdf}
    \label{Control_schematic}
\end{figure}
\clearpage
\begin{figure}[h!]
    \centering
    \caption{Schematic of the intervention scenario.}
    \includegraphics[width=1.4\textwidth]{Intervention_2.pdf}
    \label{Intervention_schematic}
\end{figure}
\end{landscape}

***/


texdoc stlog, nolog
use UTvals_AU, clear
twoway ///
(rarea UTub UTlb age if sex == 0, col(red%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 0, color(red)) ///
(rarea UTub UTlb age if sex == 1, col(blue%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 1, color(blue)) ///
, legend(order(4 "Male" ///
2 "Female") ///
cols(1) ring(0) position(1) region(lcolor(white) color(none))) ///
graphregion(color(white)) ///
ytitle(Utility) xtitle(Age) ///
ylabel(,angle(0) format(%9.2f)) xlabel(40(10)80)
texdoc graph, label(AgeUT) figure(h!) cabove fontface("Liberation Sans") caption(Age and sex-specific utility for people without CVD or diabetes in Australia.)
use UTvals_UK, clear
gen UTlb = UT-(UT*0.0255*1.96)
gen UTub = UT+(UT*0.0255*1.96)
twoway ///
(rarea UTub UTlb age if sex == 0, col(red%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 0, color(red)) ///
(rarea UTub UTlb age if sex == 1, col(blue%30) fintensity(inten80) lwidth(none)) ///
(line UT age if sex == 1, color(blue)) ///
, legend(order(4 "Male" ///
2 "Female") ///
cols(1) ring(0) position(1) region(lcolor(white) color(none))) ///
graphregion(color(white)) ///
ytitle(Utility) xtitle(Age) ///
ylabel(,angle(0) format(%9.2f)) xlabel(40(10)80)
texdoc graph, label(AgeUTUK) figure(h!) cabove fontface("Liberation Sans") caption(Age and sex-specific utility for people without CVD or diabetes in the UK.)
graph combine ///
GPH/treshPP_1.gph ///
GPH/treshPP_2.gph ///
GPH/treshSP_1.gph ///
GPH/treshSP_2.gph ///
, graphregion(color(white)) altshrink cols(2) xsize(5)
texdoc graph, label(thresh1) figure(h!) cabove fontface("Liberation Sans") ///
caption(Threshold analysis results. Grey lines show the willingness-to-pay thresholds for each country.)
clear
set obs 314
gen x = (_n/10)-_pi*5
gen y1 = sin(x)
gen y2 = cos(x+(_pi/2))
twoway ///
(line y1 x, col(magenta)) ///
(line y2 x, col(dknavy)) ///
, legend(off) graphregion(color(white)) ///
ylabel(0, nogrid angle(0)) ///
xlabel(0, nogrid) ///
ytitle("Somesuch") ///
xtitle("Somesuch") yscale(range(-2 2))
texdoc graph, label(OSAfig) figure(h!) cabove fontface("Liberation Sans") ///
caption(PLACEHOLDER. Tornado diagrams for one-way sensitivity analyses results. ///
These show the ICER at the lower and upper bounds of each model input.)
graph combine ///
GPH/treshPP_1_sce.gph ///
GPH/treshPP_2_sce.gph ///
GPH/treshSP_1_sce.gph ///
GPH/treshSP_2_sce.gph ///
, graphregion(color(white)) altshrink cols(2) xsize(5)
texdoc graph, label(threshsce) figure(h!) cabove fontface("Liberation Sans") ///
caption(Threshold analysis results for scenario analyses. ICERs are from the healthcare perspective.)
texdoc stlog close


/***





\clearpage
\section*{References}
\bibliography{Library/Library.bib}
\end{document}

***/

texdoc close


texdoc init LPA_MS2, replace logdir(LPA_MS2_dir) gropts(optargs(width=0.8\textwidth))
set linesize 100

/***
\documentclass[11pt]{article}
\usepackage{fullpage}
\usepackage{siunitx}
\usepackage{hyperref,graphicx,booktabs,dcolumn}
\usepackage{stata}
\usepackage[x11names]{xcolor}
\usepackage{natbib}
\usepackage{chngcntr}
\usepackage{pgfplotstable}
\usepackage{pdflscape}
\usepackage{amssymb}
\usepackage{multirow}
\usepackage{booktabs}
\usepackage[section]{placeins}

\usepackage{xr}
\externaldocument{LPA_MS2_A}

\newcommand{\specialcell}[2][c]{%
  \begin{tabular}[#1]{@{}l@{}}#2\end{tabular}}

\newcommand{\specialcelr}[2][c]{%
  \begin{tabular}[#1]{@{}r@{}}#2\end{tabular}}

\usepackage[superscript,biblabel]{cite}


\newcommand{\thedate}{\today}

\bibliographystyle{unsrt}
\renewcommand{\bibsection}{}
\makeatletter
\renewcommand\@biblabel[1]{	#1.}
\makeatother

\begin{document}

\begin{titlepage}
    \begin{flushright}
        \Huge
        \textbf{
Lp(a) testing and treatment with olpasiran for the primary and secondary prevention of 
cardiovascular disease in high income countries: a cost-effectiveness analysis
}
\rule{16cm}{2mm} \\
\Large
Manuscript \\
\thedate \\
       \vfill
    \end{flushright}
        \Large

\noindent
Jedidiah I Morton, PhD,\footnote{\label{HEPER}Health Economics and Policy Evaluation Research (HEPER) Group, Centre for Medicine Use and Safety, Faculty of Pharmacy and Pharmaceutical Sciences, Monash University, Melbourne, Australia}\textsuperscript{,}\footnote{Diabetes and Population Health, Baker Heart and Diabetes Institute, Melbourne, Australia}
Florian Kronenberg, PhD,\footnote{Institute of Genetic Epidemiology, Medical University of Innsbruck, Innsbruck, Austria}
[Any other authors from the Lp(a) taskforce], 
Zanfina Ademi, PhD.\textsuperscript{\ref{HEPER},}\footnote{School of Public Health and Preventive Medicine, Monash University, Melbourne, Australia}\footnote{Central Clinical School, Monash University, Melbourne, Australia}\footnote{School of Pharmacy, University of Eastern Finland, Kuopio, Finland} \\
 \\
\noindent
Correspondence to: \\
Jedidiah Morton;  
\color{blue}
\href{mailto:Jedidiah.Morton@Monash.edu}{Jedidiah.Morton@monash.edu} \\ 
\color{black}
\noindent
Zanfina Ademi; 
\color{blue}
\href{mailto:Zanfina.Ademi@Monash.edu}{Zanfina.Ademi@monash.edu} \\ 
\color{black}

\noindent
Abstract word count: 375 \\
Manuscript word count: 4,550 \\ 
Number of tables: 4 \\
Number of Figures: 1 \\
\end{titlepage}

\clearpage
\section*{Abstract}

\textbf{Background and Aims} \\
Lipoprotein(a) (Lp(a)) is an important risk factor for cardiovascular disease (CVD).
Medications that lower Lp(a) will become available in the near future. 
Therefore, we aimed to evaluate the cost-effectiveness 
of Lp(a) testing and treatment with olpasiran for people
with high Lp(a) in the primary and secondary prevention populations. \\

\noindent \textbf{Methods} \\
We constructed and validated a multi-state microsimulation Markov model that aged
primary and secondary prevention populations (n=10,000 each) aged 
between 40 and 69 until age 85 years. 
We tracked incident and recurrent myocardial infarction and stroke. Risk of CVD
was proportional to cumulative Lp(a), low-density lipoprotein-cholesterol, systolic blood pressure,
and smoking, as well as diabetes status, age, and sex. The association between 
each risk factor and CVD risk was derived from Mendelian randomisation. 
Epidemiologic data were primarily sourced from the UK Biobank study, with published data used for
data not available in the Biobank. 
We simulated an intervention that tested high-risk individuals from the primary
prevention population and all individuals in the secondary prevention population
for Lp(a). Anyone tested who had an Lp(a) level $\geq$192 nmol/L (90 mg/dL) 
was treated with Olpasiran 225 mg every 12 weeks, in addition to standard of care. 
The control was standard of care.
The primary analyses were conducted from the Australian and UK public healthcare
system and societal perspectives in 2023 AUD and GBP, with annual discounting of 5\% and 3.5\%, respectively.
Secondary analyses used a cost adaptation process to derive the cost-effectiveness for
France, Germany, Italy, The Netherlands, Spain, Poland, and the USA. \\

\noindent \textbf{Results} \\
Lp(a) testing and treatment prevented 61 and 242 CVD events 
in the primary and secondary prevention populations, respectively. 
In Australia, the incremental cost-effectiveness ratios (ICERs)
were \$422,953 (not cost-effective) and \$23,870 (cost-effective) per QALY
from the healthcare perspective, respectively; corresponding figures for the
UK were \textsterling 420,070 (not cost-effective) and 
\textsterling 23,056 (likely cost-effective) per QALY. 
Results were consistent in females and males and were robust to sensitivity analyses. 
The intervention was also likely cost-effective in 
France, Germany, Italy, The Netherlands, Spain, and the USA.

\noindent \textbf{Conclusions} \\

Lp(a) testing and treatment with olpasiran among people with an Lp(a) $\geq$90 
mg/dL is cost-effective for the secondary prevention of CVD, but would not be cost-effective in
the primary prevention population, at assumed olpasiran prices.

\clearpage
\section*{Introduction}

Lipoprotein(a) (Lp(a)) is an important risk factor for cardiovascular 
disease (CVD) \cite{LaminaJAMAC2019,LarssonCirc2020,WelshEJPC2021}. 
However, Lp(a) is infrequently measured in clinical practice, and there
were no Lp(a)-lowering treatments available until recently. 
Therefore, with anywhere from $\sim$10-20\% of individuals
having high Lp(a) \cite{WelshEJPC2021,NordEHJ2010}, 
targeting Lp(a) will be a key aspect in addressing the
costly and rising burden of CVD in high-income 
countries \cite{LuengoEHJ2023,KaziCirc2024,AbebeEHJ2023,NordLancet2024}.

Indeed, several treatments for lowering Lp(a) are currently being tested in
clinical trials, including pelacarsen, olpasiran, zerlasiran, lepodisiran,
and muvalapin, with the most effective therapies
lowering Lp(a) up to 98\% \cite{NordLancet2024}. 
However, to date, no study has evaluated the cost-effectiveness of 
Lp(a) testing and treatment with an Lp(a)-lowering therapy in the primary and secondary
prevention populations. One study has estimated the cost-effectiveness
of olpasiran and pelacarsen in small and specific clinical trial populations \cite{BurvillJCI2024},
but this study did not factor in testing costs among people without high Lp(a), included
only individuals with a single (elevated) Lp(a) value, and did not include a primary prevention
population.

Therefore, we have constructed a state-of-the-art health economic model to 
evaluate the cost-effectiveness of Lp(a) testing and treatment with Olpasiran 225 mg every 12 weeks
for people with high Lp(a) in the primary and secondary prevention populations,
compared to current standard of care. The primary analysis was conducted
from the Australian and UK national healthcare system and societal perspectives, 
with secondary analyses  adapting the results to other high-income countries: 
France, Germany, Italy, The Netherlands, Spain, Poland, 
and the United States of America (USA). 


\clearpage
\section*{Methods}

All syntax and a more detailed explanations of the methods are available in an online protocol 
(available at: \color{blue}\href{https://github.com/jimb0w/LPA}{https://github.com/jimb0w/LPA}\color{black}). 
All analyses were conducted in Stata, Version 17.0 (StataCorp, Texas, USA). 
We have completed this study in accordance with the CHEERS checklist (Appendix).


\subsection*{Model overview}

The model is represented schematically in Supplementary Figure~\ref{Schematic}
and has been described previously (Morton et al., under review).
We constructed a microsimulation model that ages people in 1-year cycles from
study entry (40-69 years) until 85 years. 
People in the model were at risk of myocardial infarction (MI) and stroke 
(ischemic and hemorrhagic) -- selected because they are the two most frequent CVDs \cite{RothJACC2020} --
as well as diabetes and death (from CVD and non-CVD causes). 
Thus, the microsimulation model had the following health states: 
No MI, stroke, or diabetes; MI; stroke; diabetes; MI and stroke;
MI and diabetes; stroke and diabetes; MI, stroke and diabetes; and death. 
We also tracked repeat MI and stroke. 

In the primary prevention population, risk of CVD was determined by
sex, age, Lp(a), diabetes status, 
low-density lipoprotein-cholesterol (LDL-C), systolic blood pressure (SBP), and smoking. 
LDL-C, SBP, smoking, and diabetes were included as CVD risk factors because they are
causal and the most evidenced-based \cite{WilsonCirc1998,GoffCirc2014}. 
In the secondary prevention population, CVD risk was determined by sex, 
age, prior MI and/or stroke, and Lp(a). 

To determine CVD risk in the model, we used a methodological framework that we have
outlined previously to incorporate the 
cumulative effects of cardiovascular risk factors when determining CVD risk \cite{MortonVIH2024}.
Briefly, we assumed that the risk of CVD was proportional to the cumulative
exposure to LDL-C, SBP, Lp(a), and smoking at a given age 
(this is similar to cholesterol-years, smoking pack-years, etc.),
an assumption that is strongly supported \cite{FerenceJAMA2019,PopeAQAH2010,BurgessJAMAC2018}. 
Thus, the effects of these risk factors were proportional to both magnitude and duration of exposure,
which the model calculated by tracking risk factor levels over the lifetime and
adjusting event risk based on lifetime levels. 
The effect of diabetes on event risk was considered binary. 
The relationship between these lifetime risk factor trajectories (or diabetes status)
and event risk was quantified using Mendelian randomisation studies, which are
shown in Supplementary Table~\ref{MRinputs}.

The model was validated using tests based on the AdViSHE tool \cite{ADVISHE} and calibrated using data
from clinical trials (Protocol).


\subsection*{Epidemiological inputs}

Epidemiological inputs are summarised in Supplementary Table~\ref{Einputs}.
Epidemiological data were primarily derived from the UK Biobank study \cite{SudlowPLOSMED2015},
the data from which contains demographic, clinical, and genomic data for approximately 
500,000 participants enrolled between 2006 and 2010 in the UK.

To estimate the incidence of first MI (fatal and non-fatal), first stroke (fatal and non-fatal), 
and non-CVD mortality prior to the development of CVD, 
we used age-period-cohort models \cite{CarstensenSTATMED2007}, 
as previously described (Morton et al., under review). Briefly, we used sex-stratified Poisson models
where the outcome was the number of events in a time interval,
the offset log-person-years, and predictors spline effects of age, year, and cohort (year minus age), 
with a log link function to estimate the incidence of each outcome by age
in one year increments and sex, with the prediction year set at 2016.
The incidence rates are shown in Supplementary Figures~\ref{CVinc}-\ref{codmr}. 

We followed a similar approach to estimate the rate of MI, stroke, 
and non-CVD mortality following the development of CVD (Morton et al., under review).
We fit sex-stratified Poisson models, where the outcome was the number of events in a time interval,
the offset log-person-years, and predictors spline effects of age and factor effects of prior MI and/or stroke,
with a log link function, which were used to estimate the rate of each outcome
by sex and age (in one year increments). 
The rates of these outcomes are shown in Supplementary Figure~\ref{CVincpev}. 

We derived the age and sex-specific incidence of diabetes from the most recent UK study
of diabetes incidence \cite{PalBMJODRC2021} 
(Morton et al., under review). 
We used a Poisson model with incident diabetes cases as the outcome,
(log) person-years of follow-up as the exposure, and included a spline effect of age,
fit separately by sex, with a log link function, to
estimate the age and sex-specific incidence of type 2 diabetes in 1-year increments 
(Supplementary Figure~\ref{t2dincgph}).

The effect of risk factors on the incidence of outcomes was incorporated via the following equation:
\begin{quote}
\begin{math}
R_a = R \times M^{x-\mu}
\end{math}
\end{quote}
where 
\begin{math} R_a \end{math} is the risk factor-adjusted age and sex-specific rate of CVD,  
\begin{math} R \end{math} is the age- and sex-specific rate of CVD for the whole population, 
\begin{math} M \end{math} is the measure of association from a Mendelian Randomisation study, 
\begin{math} x \end{math} is the time-weighted (time-weighting is described in the Protocol) 
mean cumulative level of the risk factor (or LSI) for the individual in the simulation, and 
\begin{math} \mu \end{math} is the time-weighted mean cumulative level of the risk factor 
(or LSI) across the whole population.  

Therefore, we simulated two risk factor trajectories: \begin{math} x \end{math} and \begin{math} \mu \end{math}.
This involved the following assumptions to estimate \begin{math} \mu \end{math}. We assumed LDL-C at birth 
was 0.75 mmol/L \cite{DescampsAth2004}, increasing linearly to 2 mmol/L by age 5 years \cite{KitJAMA2012},
and, from age 5, increasing linearly to the mean value of LDL-C in the UK Biobank population at age 40 years. 
Lp(a) was assumed to be constant from birth until age 40 years, because it is 
fully expressed by the first year of life \cite{WangPed1992,RifaiAth1992,McNealJCL2015}.
Finally, we assumed SBP was 85 mmHg at age 1 year and increased linearly to 118mmHg at age 17 \cite{FourthHBP},
before increasing linearly to age 40 years \cite{JiJAMA2020}.

For people aged 40-69 years, the values of \begin{math} \mu \end{math} for LDL-C, SBP, Lp(a), the LSI, and diabetes prevalence
were estimated using generalised linear models fit on data from UK Biobank baseline assessments. 
Values for people aged 70-84 years were projected from these models.

We made these and further assumptions to estimate \begin{math} x \end{math}.
We assumed: LDL-C was constant from age 40 years without
the initiation of lipid lowering therapy \cite{DuncanJAHA2019}; 
people on lipid lowering therapy at baseline initiated therapy 5 years 
prior and that this lowered LDL-C by 
30\% \cite{FangLHD2021,BacquerEJPC2020}; where an individual 
sits on the LDL-C distribution (relative to the population) is constant; 
SBP increases linearly from the model start point at a rate equal to the mean
rate for their sex; people on anti-hypertensive therapy at baseline initiated therapy 10 years 
prior and that one, two, and three antihypertensive drugs 
lead to SBP reductions of 6.7 mmHg, 13.3 mmHg, and 19.9 mmHg, 
respectively \cite{LawBMJ2003}; smokers do not quit and non-smokers do not start smoking; and, finally,
high-density lipoprotein-cholesterol (used only for CVD risk calculation, see below) 
remains constant over the lifetime. 

Notably, the UK Biobank does not contain Lp(a) values for people with an Lp(a) of 189.1 nmol/L (88.5 mg/dL) and above (approximately
7\% of the population), and the return in which these have been calculated has not been made available to researchers yet. 
Therefore, we imputed Lp(a) values for a subset of the sample with missing Lp(a); 
we have previously shown this imputation is inconsequential for 
the purposes of our modelling approach \cite{MortonVIH2024}.
 

\subsection*{Population, intervention, and control}

The study populations were individuals without CVD (primary prevention)
and with CVD (secondary prevention), initially aged between 40 and 69 years,
followed until age 85 years (a lifetime horizon). 
For each population, we included in our model 10,000 randomly 
selected individuals from the UK Biobank who met these criteria
and had the requisite information on 
their LDL-C, Lp(a), SBP, and high-density lipoprotein-cholesterol.

The standard of care (control) scenario was based on the European guidelines for 
CVD prevention \cite{VisserenEHJ2021}; we simplified the guidelines into the following points
relevant to the model (Supplementary Figure~\ref{Control_schematic}). First, everyone with diabetes received a high intensity statin 
and treatment for hypertension if they had an SBP of $\geq$140 mmHg.
Second, people without diabetes were tested for CVD risk every 5 years
using the updated Systemic Coronary Risk Estimation (SCORE2) algorithm \cite{SCORE2}; 
individuals deemed ``Very high risk'' from SCORE2 were treated with a 
high intensity statin and received pharmacological anti-hypertensive treatment if they had an SBP of $\geq$140 mmHg. 
Fourth, individuals deemed `High risk'' or lower will not be pharmacologically treated unless
they have an LDL-C level of $\geq$5.0 mmol/L or a SBP of $\geq$160 mmHg.
And fifth, individuals became ``Very high risk'' once they reached age 70 years 
and received a high intensity statin and treatment for hypertension 
if they had a systolic blood pressure (SBP) of $\geq$140 mmHg.

The high intensity statin we used in this study was atorvastatin 80 mg once daily, as it is
one of the most used statins across high income countries \cite{TalicCDT2022,MatSPJ2023,RochatAJC2023}. 
It reduced LDL-C by 51.7\% (51.2, 52.2) \cite{AdamsCDSR2015}.
Treatment for hypertension mimicked the SPRINT trial \cite{SPRINT2015},
with the most common medications used in the intensive arm --
losartan 100 mg, chlortalidone 25 mg, and amlodipine 10 mg -- and assumed a 
20 mmHg ($\pm$25\%) reduction in SBP. 

The intervention scenario was standard of care plus Lp(a) testing for everyone
with diabetes, prior CVD, aged $\geq$70 years, or who were deemed ``Very high risk''
via SCORE2 (Supplementary Figure~\ref{Intervention_schematic}). 
People with an Lp(a) of at least 192 nmol/L (90 mg/dL) were 
treated with olpasiran 225 mg once every 12 weeks. We selected olpasiran
because it is therapy that is likely to be released soonest of the three Lp(a)-lowering therapies
that lower Lp(a) by $\sim$98\% (olpasiran, zerlasiran, and lepodisiran) \cite{NordLancet2024}.
Olpasiran 225 mg every 12 weeks was assumed to lower LP(a) by 97.5\% (95\%CI: 94.0, 100.0),
per the phase 2 OCEAN(a)-DOSE trial \cite{ODONEJM2022}.


\subsection*{Health economic inputs}

All health economic inputs are shown in Supplementary 
Tables~\ref{heaegtabu} and ~\ref{heaegtabc} and are the same as we 
have previously described (Morton et al., under review).
The primary analysis was from the Australian and UK
National healthcare system and societal perspectives. 

The utilities in this study were derived from the EuroQol—five dimensions (EQ-5D) questionnaire \cite{EQ5D}.
The utility for people without diabetes or CVD in Australia was derived from 
a cross-sectional study of the Australian general population by McCaffrey et al \cite{McCaffreyHQLO2016};
we used regression to estimate age and sex-specific utilities in 1-year increments (Supplementary Figure~\ref{AgeUT}). 
The utility for people without diabetes or CVD in the UK was derived from the Health Survey for England \cite{ARAVIH2010},
and was set with the equation: 
\begin{math} 0.9454933 + 0.0256466 \times male - 0.0002213 \times age - 0.0000294 \times age^2 \end{math} (Supplementary Figure~\ref{AgeUTUK}).
Chronic utilities for diabetes, MI, or stroke were derived from systematic 
reviews \cite{BeaudetVIH2014,BettsHQLO2020,JoundiJAHA2022}. 
These were set at 0.785 (95\%CI: 0.681, 0.889), 0.79 (0.73, 0.85), and 0.65 (0.63, 0.67), respectively,
and were applied multiplicatively to the age and sex-specific values for people without diabetes and CVD. 
Chronic disutilities for diabetes and MI and/or stroke were set at 
$-$0.055 ($-$0.067, $-$0.042) for diabetes and MI and $-$0.164 ($-$0.222, $-$0.105) 
for diabetes and stroke (and diabetes and MI and stroke). These values were derived
from the same systematic review and applied 
additively to the diabetes utility before multiplication by 
the age and sex-specific values for people without diabetes and CVD. 

Acute disutility values for MI and stroke were also applied. 
For MI, this was set at $-$0.01125 ($\pm$20\%) for one cycle (equivalent to
the $-$0.045 disutility reported over 3 months in the study it was derived from) \cite{LaceyEJCN2004}.
For stroke, the disutility was set at $-$0.03 ($\pm$20\%) for one cycle (again, equivalent
to the $-$0.12 disutility reported over 3 months in the study it was derived from) \cite{JoundiJAHA2022}.
These were applied additively to the utility estimate after accounting for age and sex.

All costs in the primary analysis were in 2023 Australian dollars (\$, hereafter) and 
Great British pounds (\textsterling, hereafter), 
inflated (when necessary) using the Health Price Index \cite{AUSHPI23} 
and NHS cost inflation index \cite{NHSinflation2023}, for Australia and the UK, respectively. 

For Australia, acute costs for events and chronic costs for health states
were derived from cohort studies \cite{MortonDLOGIA2023,LeeDRCP2013,MarquinaEJPC2022,CobiacBMCPH2012,MortonVIH2024}.
Fatal MIs and strokes were assumed to result in hospitalisation 23\% and 84\% of the time, respecitvely \cite{MortonVIH2024},
in both Australia and the UK, with acute costs adjusted accordingly. 
The once-off cost of an Lp(a) test was set at \$25. All medication costs, except olpasiran, 
were derived from the Pharmaceutical
Benefits Scheme and set at
\$200 annually for atorvastatin 80 mg,
\$200 annually for losartan 100 mg,
\$143 annually for chlortalidone 25 mg, and
\$212 annually for amlodipine 10 mg \cite{PBSDOS23}.
As olpasiran is not yet available, we based the annual price of olpasiran on another biologic used to 
treated CVD -- evolocumab -- which has an annual price of \$4,360 in Australia \cite{PBSDOS23}.
The medication costs for the secondary prevention population were captured in the
chronic health state costs costs and therefore not modelled explicitly. 

For the UK, chronic costs for all health states were derived from a study by Public Health England \cite{PHEcosts2020}.
The acute costs of MI and stroke were derived from the UK National Health Service Cost Schedule in 2021/22 \cite{NHSCOST202122}. 
The once-off test cost of an Lp(a) test was set at \textsterling 40.
All medication costs, except olpasiran, were derived from the NHS drug tariff
and set at 
\textsterling 18.00 annually for atorvastatin 80 mg,
\textsterling 15.91 annually for losartan 100 mg,
\textsterling 12.42 annually for chlortalidone 25 mg, and
\textsterling 9.91 annually for amlodipine 10 mg \cite{NHSDrugTariff062023}.
As olpasiran is not yet available, we based the annual price of olpasiran on another biologic used to 
treated CVD -- inclisiran -- which has an annual price of \textsterling 3975 in the UK \cite{NHSDMDInclisiran2024}.

Indirect costs were estimated using the human capital approach \cite{VanARD2010}.
We included costs due to lost earnings due to absenteeism, workforce dropout due to
diabetes or CVD, and loss of future earnings due to death before retirement (67 in Australia and 66 years in the UK). 
Indirect costs were calculated by multiplying lost work time (determined 
using age and sex-specific employment rates \cite{ABSEmployment,ONSEmployment}) by the average annual salary (\$73,003 in Australia and
\textsterling 34,855 in the UK \cite{ABSWeeklyEarnings,ONSWeeklyEarnings}).
Acute absenteeism for an MI was set at 55 ($\pm$20\%) days \cite{WorcHLC2014},
and 90 days ($\pm$20\%) for stroke \cite{RadfordJRM2020}.
Chronic absenteeism for CVD and diabetes were set at 21.5 ($\pm$20\%) and 6 (2-10) days annually \cite{AIHWCDPW,BretonDC2013}.
The workforce non-participation ratios for MI and stroke were set at 1.46 (1.36, 1.55) and 1.92 (1.80, 2.06), respectively \cite{BinPlos2021},
and the workforce non-participation for diabetes took age and sex specific values \cite{ZhangJHE2009}.


\subsection*{Outcomes}

For each scenario we calculated the years of life lived 
and quality-adjusted life years (QALYs) in each health state,
as well as direct and indirect costs. 
The primary outcome was the the incremental cost-effectiveness ratio (ICER), 
defined as the incremental healthcare costs divided by the incremental QALYs
comparing the intervention to standard of care. 
In the primary analysis, all health economic outcomes underwent discounting at 5\% in Australia and
3.5\% in the UK (per guidelines \cite{PBACG,NICEHTA2013}), and results were compared to their
respective willingness-to-pay thresholds of \$28,000 per QALY gained in Australia \cite{EdneyPHEC2018}
and \textsterling 20,000 to \textsterling 30,000 per QALY in the UK \cite{NICEHTA2013}.
We stratified results by starting age group (40-49, 50-59, and 60-69) and sex. 


\subsection*{Cost adaptation analyses}

To provide an indication of the cost-effectiveness of Lp(a) testing and treatment in multiple other
high-income countries, we used a cost adaptation method based on that reported by Ademi et al. \cite{AdemiCA2018,MacEHJ2022}.
This method adapts all cost inputs based on comparative
differences between countries in per-capita healthcare spending, 
purchasing power parity, and mean annual income, from  
the Organization for Economic Cooperation and Development (OECD) \cite{OECDHS,OECDPPP,OECDAAW}.
We performed cost adaptation from both the healthcare system and societal perspectives for
France, Germany, Italy, The Netherlands, Spain, Poland, and the USA, using the UK as the reference.
The ICER derived through cost adaptation is only an estimation and does not represent the true ICER
-- it may not fully capture the actual cost-effectiveness in each country. 
These ICERs were compared to cost-effectiveness thresholds estimated by Pichon-Riviere et al. \cite{PRLGH2023}.


\subsection*{Sensitivity and scenario analyses}

We conducted one-way sensitivity analyses by varying the model inputs between
the lower and upper bounds shown in Supplementary Tables~\ref{MRinputs}-\ref{heaegtabc}, 
presenting the results in a Tornado diagram. 
We conducted probabilistic sensitivity analyses using 1,000 Monte Carlo 
simulations based on the uncertainty in the model inputs. We used the probabilistic
sensitivity analysis to compute 95\% uncertainty intervals by taking the 2.5\textsuperscript{th}
and 97.5\textsuperscript{th} centiles of the simulation results. 

We also conducted four scenario analyses. In the first three, we varied
the Lp(a) threshold at which treatment occurs from 192 nmol/L (90 mg/dL) to 105 nmol/L (50 mg/dL),
149 nmol/L (70 mg/dL), and 236 nmol/L (110 mg/dL), respectively. In the fourth, we used 0\% annual discounting. 

Finally, because we were using assumed costs for olpasiran, 
we conducted threshold analyses to estimate the annual cost of olpasiran
that would result in ICERs under the willingness-to-pay threshold of each of Australia
and the UK. 

\clearpage
\section*{Results}

\subsection*{Overall}

The baseline characteristics of the primary and secondary prevention populations simulated
are shown in Table~\ref{popcharMStab}. The median Lp(a) was 10.6 (IQR: 5.2, 35.1) in the primary
prevention population and 13.6 (5.6, 53.1) in the secondary prevention population, with 7.1\%
and 10.8\% with an $\geq$192 nmol/L (90 mg/dL), respectively. 

In the primary prevention population, Lp(a) testing was performed 
on 95.5\% of the sample, and 6.8\% of the sample initiated olpasiran 
following testing (Table~\ref{BCDtabpp}). Lp(a) testing and treatment with olpasiran
prevented 61 CVD events and 22 deaths compared to standard of care, leading to a gain 
of 39 years of life lived and 48 QALYs for Australia and 52 years of life lived and 55 QALYS for the UK. 
The intervention led to a decrease in acute and chronic
healthcare costs and indirect costs compared to standard of care in both Australia and the UK, 
but a large increase in medication costs, resulting in net total costs of \$20.4 million and 
\textsterling 23.2 million from the healthcare 
perspective and \$20.1 million and \textsterling 23.0 million 
from the societal perspective in Australia and the UK, respectively. 
The intervention was not cost-effective in Australia or the UK, 
with ICERs of \$429,756 and \textsterling 422,978 per QALY from
the healthcare perspective, and \$422,953 and 
\textsterling 420,070 per QALY from the societal perspective, respectively. 
Threshold analyses indicated that the intervention would be cost-effective
in the primary prevention population with annual costs of olpasiran of $\sim$\$400
in Australia and $\sim$\textsterling 300 in the UK (Supplementary Figure~\ref{thresh1}). 

In the secondary prevention population, 10.8\% of the sample initiated olpasiran
following Lp(a) testing  (Table~\ref{BCDtabsp}). The intervention prevented 242 CVD events and 61 deaths, 
leading to a gain of 245 QALYs in Australia and 272 QALYs in the UK. The extention
of life among people with CVD led to an increase in chronic healthcare costs, as well
as an increase in medication costs, but
a decrease in acute (event) costs and indirect costs, resulting in a total cost
increase of \$5.8 million in Australia and \textsterling 6.3 in the UK from the healthcare perspective,
and \$2.1 million in Australia and \textsterling 4.6 million in the UK from the societal perspective. 
Lp(a) testing and treatment was cost-effective in Australia from both perspectives (ICER: \$23,870 per QALY; 
societal ICER: \$8,612 per QALY), and was potentially
cost-effective from the healthcare perspective (ICER: \textsterling 23,056 per QALY, which is in the willingness-to-pay range of \textsterling
20,000-30,000 per QALY) and cost-effective 
from the societal perspective (ICER: 16,805) in the UK.


\subsection*{Stratified by age and sex}

The intervention was not cost-effective in females or males or with any starting
age among the primary prevention population in Australia and the UK 
(Supplementary Tables~\ref{ABCDtab2ppa1}-\ref{UBCDtab2ppa5}).

Among the secondary prevention population, ICERs were similar in females and males
in both Australia and the UK (Supplementary Tables~\ref{ABCDtab2spa1}-\ref{UBCDtab2spa5}). 
ICERs were \$24,129, \$17,282, and \$29,115 per QALY from the healthcare perspective
and $-$\$37,552 (cost-saving), $-$\$10,437, and \$27,884 per QALY from the societal perspective among people aged 40-49, 
50-59, and 60-69 years at baseline in Australia, respectively; corresponding
figures for the UK were \textsterling 25,441, \textsterling 17,419, and 
\textsterling 27,621 per QALY from a healthcare perspective, and 
\textsterling 281, 5,555, and 27,699 per QALY from a societal perspective, respectively. 


\subsection*{Cost adaptation analyses}

The intervention was not cost-effective in the primary prevention population
in any country simulated (Supplementary Table~\ref{CArespp}). 
In the secondary prevention population, the intervention
was cost-effective in France, Germay, Italy, The Netherlands,
Spain, and the USA, but not Poland, from both the healthcare and societal perspectives (Table~\ref{CAressp}). 


\subsection*{Sensitivity and scenario analyses}

The results of the one-way sensitivity analyses are presented in Supplementary Figure~\ref{OSAfig} (TBD).
The results of the probabilistic sensitivity analyses are presented 
in Figure~\ref{PSAfig} and Supplementary Table~\ref{PSAtab2} (TBD).

The results of the scenario analyses are shown in Supplementary Tables~\ref{ABCDtab2ppsce1}-\ref{UBCDtab2spsce5}.
No scenario analyses had material impacts on the conclusions for the primary prevention population.
The price at which olpasiran would be cost-effective in the primary prevention population ranged
from $\sim$\$200-\$600 in australia 
and $\sim$ \textsterling 100-\textsterling 500 in the UK (Supplementary Figure~\ref{threshsce}).

In the secondary prevention population, 
incremental QALYs increased with a decreasing Lp(a) threshold for initiation of olpasiran -- QALYs gained
for the intervention vs. control were 353, 323, 245, and 119 in Australia and 
385, 353, 272, and 129 in the UK with thresholds of $\geq$50, $\geq$70, $\geq$90 (base case), and $\geq$110. 
However, a lower threshold led to higher treatment costs and ICERs
were lower with an increasing threshold in Australia (\$32,860, \$28,047, \$23,870, 
and 20,131 per QALY, respectively)
and the UK (\textsterling 29,958, \textsterling 26,836, \textsterling 23,056, and 
\textsterling 21,007 per QALY, respectively). 0\% discounting led to much greater QALY gain and lower ICERs,
but conclusions about cost-effectiveness were similar to the base case. 
 

\clearpage
\section*{Discussion}

At expected olpasiran prices, Lp(a) testing
and treatment of people with an Lp(a) $\geq$192 nmol/L (90 mg/dL) was not
cost-effective in the primary prevention population in any country simulated. 
Our threshold analyses indicated that this strategy would be cost-effective with
a price of olpasiran of $\sim$\$400
in Australia and $\sim$\textsterling 300 in the UK. 
Conversely, among the secondary prevention population, Lp(a) testing
and treatment was likely cost-effective in Australia and the UK, 
as well as in France, Germay, Italy, The Netherlands,
Spain, and the USA, but not Poland. 
These findings support the implementation of testing and treatment of 
Lp(a) in the population with pre-existing CVD as a cost-effective strategy
to prevent recurrent CVD and death. 

It is important to keep improving treatment and prevention of CVD because, despite
major advances, it remains a leading cause of morbidity and mortality worldwide \cite{RothJACC2020}. 
As Lp(a) is an important risk factor for CVD, Lp(a)-based testing and treatment strategies
are potentially effective means to improve CVD treatment and prevention. 
Indeed, the present study builds on our previous work. We recently showed that 
Lp(a) testing to reclassify CVD risk in the primary prevention population
is a clinically warranted and highly cost-effective way to prevent CVD, 
even in the abscence of an effective treatment for Lp(a) itself (Morton et al., under review). We have
also estimated the cost-effectiveness
of Olpasiran among a group with high Lp(a) (which omitted the testing costs in the broader population) 
that found olpasiran to be cost-effective in the Australian setting \cite{BurvillJCI2024}.
We extend these results by demonstrating that Lp(a) is not only a 
cost-effective risk stratifier in the primary prevention
population, but also a cost-effective treatment target after 
the development of CVD, even at a very high annual treatment
cost as simulated here.

This study also demonstrated that selecting an Lp(a) threshold at which to
initiate treatment in the secondary prevention population can have a major
impact on the prevention of recurrent CVD and death, with lower treatment
thresholds leading to considerably more events prevented. However,
this was at the cost of slightly higher ICERs, although relatively small price
reductions in olpasiran would have made these Lp(a) threshold cost-effective.
This is in contrast to the primary prevention population, where major cost reductions
would be required to reach cost-effective ICERs. It is harder to reach cost-effectiveness
in primary prevention populations compared to secondary prevention populations,
due to the lower overall risk and longer treatment duration required to show benefit. 
However, the longer duration of treatment corresponds to a 
greater overall volume of sales,
which could lead to similar overall revenue and underpin an argument for a reduction
in costs for the primary prevention population. 

It should be emphasised that Lp(a) lowering has not yet been shown
to lower cardiovascular events in phase III clinical trials (the results of which
will be published in coming years \cite{NordLancet2024});
our results should be interpreted with this limitation in mind. Nevertheless,
the overwhelming majority of the literature supports the role of Lp(a)
as a causal risk factor for 
CVD \cite{LaminaJAMAC2019,LarssonCirc2020,NordLancet2024,BurgessJAMAC2018,KronEHJ2022,LarssonMet2022}, 
strongly suggesting that Lp(a) lowering will be shown to be effective for CVD prevention in these trials. 
Indeed, we were only able to simulate the causal effect of Lp(a)-lowering using
Mendelian randomisation estimates because they demonstrated that Lp(a) has a causal impact
on CVD \cite{LaminaJAMAC2019,LarssonCirc2020,BurgessJAMAC2018}.

Another limitation of the present study is that the UK Biobbank
has a ``healthy volunteer'' bias \cite{FryAJE2017}, although this would make our
estimates of cost-effectiveness underestimates.
Another issue of representativeness is that the underlying event rates
are all from the UK, which may not be representative for the range of countries
for which we presented results;
the UK has a CVD mortality rate that is among the lowest in Europe \cite{TimLRH2023},
again implying our results would under-estimate cost-effectiveness. 
Indeed, in the cost adaptation analysis the calculated ICERs should be viewed 
as approximate estimates rather than precise country-specific outcomes, 
as this evaluation does not account for parameters unique to individual healthcare systems. 

Our model only only included MI and stroke, while other CVDs would be impacted by Lp(a) testing and treatment,
again implying our results may underestimate the cost-effectiveness.
Finally, due to the lack of large-scale clinical trial evidence with olpasiran,
we did not include treatment side-effects, which at present are largely unknown. 
It will be important to reconsider our results if there are any severe and/or
costly side-effects of olpasiran treatment. 

In conclusion, Lp(a) testing and treatment with olpasiran 
among people with an Lp(a) $\geq$ 192 nmol/L (90 mg/dL) is cost-effective for the secondary
prevention of CVD, but would not be cost-effective in the primary prevention
population at expected prices. Therefore, implementation
of Lp(a) testing and treatment with olpasiran is warranted 
among people with existing CVD, and while
this will come with challenges not explored in our work (such as 
scaling up Lp(a) testing capability, 
education of patients and clinicians,
and ensuring that implementation does not exacerbate health inequality),
these challenges are likely far outweighed by the benefits
of reducing the still substantial impact of CVD on people and society. 


\clearpage
\begin{landscape}
\section*{Tables and Figures}
\thispagestyle{empty}

\begin{table}[h!]
  \begin{center}
    \caption{Baseline characteristics for the model starting populations.}
    \label{popcharMStab}
	\hspace*{-2cm}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Population,
		assign cell content/.code={
\pgfkeyssetvalue{/pgfplots/table/@cell content}
{\multirow{8}{*}{##1}}}},
	  display columns/1/.style={column name=Statistic, column type={l}, text indicator="},
      display columns/2/.style={column name=Females, column type={r}},
      display columns/3/.style={column name=Males, column type={r}},
      display columns/4/.style={column name=Overall, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every nth row={8}{before row=\midrule},
        every last row/.style={after row=\bottomrule},
    ]{CSV/popchar_MS2comb.csv}
  \end{center}
Numeric variables are presented as median (25th centile, 75th centile; minimum, maximum). \\
Abbreviations: 
LDL-C -- Low density lipoprotein-cholesterol; 
Lp(a) -- Lipoprotein(a); 
SBP -- Systolic blood pressure;
LSI -- Lifetime smoking index.
\end{table}
\end{landscape}

\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results for Lp(a) testing and treatment (intervention) compared to standard of care (control). 
Primary prevention population.
Full results are shown Supplementary Tables ~\ref{BCDtab2ppfa} and ~\ref{BCDtab2ppfu}.}
    \label{BCDtabpp}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
		every row no 8/.style={before row=\hline},
		every row no 19/.style={before row=\hline},
    ]{CSV/BCrestabsumpaper2_PP.csv}
  \end{center}
Abbreviations: 
MI -- Myocardial infarction;
YLL -- Years of life lived;
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}


\clearpage
\begin{table}[h!]
  \begin{center}
    \caption{Base case results for Lp(a) testing and treatment (intervention) compared to standard of care (control). 
Secondary prevention population.
Full results are shown Supplementary Tables ~\ref{BCDtab2spfa} and ~\ref{BCDtab2spfu}.}
    \label{BCDtabsp}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
		every row no 6/.style={before row=\hline},
		every row no 17/.style={before row=\hline},
    ]{CSV/BCrestabsumpaper2_SP.csv}
  \end{center}
Abbreviations: 
MI -- Myocardial infarction;
YLL -- Years of life lived;
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}

\clearpage
\thispagestyle{empty}
\begin{table}[h!]
  \begin{center}
	\vspace*{-1cm}
    \caption{Cost adaptation results. Secondary prevention population.}
    \label{CAressp}
     \pgfplotstabletypeset[
      col sep=colon,
      header=false,
      string type,
	  display columns/0/.style={column name=Country, column type={l}, text indicator="},
	  display columns/1/.style={column name=Outcome, column type={l}, text indicator="},
      display columns/2/.style={column name=Control, column type={r}},
      display columns/3/.style={column name=Intervention, column type={r}},
      display columns/4/.style={column name=Difference, column type={r}},
      every head row/.style={
        before row={\toprule
					},
        after row={\midrule}
            },
        every last row/.style={after row=\bottomrule},
        every nth row={5}{before row=\midrule},
    ]{CSV/CAres2sp.csv}
  \end{center}
Abbreviations: 
QALY -- Quality-adjusted life years;
ICER -- Incremental cost-effectiveness ratio;
SICER -- Incremental cost-effectiveness ratio (societal perspective).
\end{table}

\clearpage
***/

texdoc stlog, nolog
clear
set obs 314
gen x = (_n/10)-_pi*5
gen y1 = sin(x)
gen y2 = cos(x+(_pi/2))
twoway ///
(line y1 x, col(magenta)) ///
(line y2 x, col(dknavy)) ///
(line x y1, col(magenta)) ///
(line x y2, col(dknavy)) ///
, legend(off) graphregion(color(white)) ///
ylabel(0, nogrid angle(0)) ///
xlabel(0, nogrid) ///
ytitle("Somesuch") ///
xtitle("Somesuch") yscale(range(-2 2))
texdoc graph, label(PSAfig) figure(h!) cabove fontface("Liberation Sans") ///
caption(PLACEHOLDER. Probablistic sensitivity analyses results presented in a ///
common cost-effectiveness plane.)
texdoc stlog close


/***


\clearpage
\section*{References}
\bibliography{Library/Library.bib}
\end{document}

***/

texdoc close




cd "/home/jed/Documents/LPA"

! pdflatex LPA_MS1_A
! pdflatex LPA_MS1_A
! bibtex LPA_MS1_A
! pdflatex LPA_MS1_A
! bibtex LPA_MS1_A
! pdflatex LPA_MS1_A

! pdflatex LPA_MS1
! pdflatex LPA_MS1
! bibtex LPA_MS1
! pdflatex LPA_MS1
! bibtex LPA_MS1
! pdflatex LPA_MS1


! pdflatex LPA_MS2_A
! pdflatex LPA_MS2_A
! bibtex LPA_MS2_A
! pdflatex LPA_MS2_A
! bibtex LPA_MS2_A
! pdflatex LPA_MS2_A

! pdflatex LPA_MS2
! pdflatex LPA_MS2
! bibtex LPA_MS2
! pdflatex LPA_MS2
! bibtex LPA_MS2
! pdflatex LPA_MS2


! pdflatex LPA
! pdflatex LPA
! bibtex LPA
! pdflatex LPA
! bibtex LPA
! pdflatex LPA


! git init .
! git add LPA.do LPA.pdf LPA_MS1.tex LPA_MS1.pdf LPA_MS1_A.pdf LPA_MS1_dir LPA_MS2.tex LPA_MS2.pdf LPA_MS2_A.pdf LPA_MS2_dir CSV Study_1.xlsx
! git commit -m "0"
! git remote remove origin
! git remote add origin https://github.com/jimb0w/LPA.git
! git remote set-url origin git@github.com:jimb0w/LPA.git
! git push --set-upstream origin master
