import { Link } from "@tanstack/react-router";
import { GraduationCap } from "lucide-react";

export function Footer() {
  return (
    <footer className="mt-16 border-t bg-card text-card-foreground">
      <div className="mx-auto max-w-6xl px-4 py-12 md:px-8">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div className="md:col-span-1 space-y-4">
            <Link to="/" className="flex items-center gap-2.5">
              <div className="grid h-8 w-8 place-items-center rounded-xl bg-primary text-primary-foreground text-sm font-bold shadow-sm">
                <GraduationCap className="h-4 w-4" />
              </div>
              <div className="font-semibold leading-tight">
                dMAT Practice Pro
              </div>
            </Link>
            <p className="text-sm text-muted-foreground">
              The definitive preparation platform for the Digital Master Assessment Test (dMAT). 
            </p>
          </div>

          <div>
            <h4 className="font-semibold mb-4">Practice</h4>
            <ul className="space-y-2 text-sm text-muted-foreground">
              <li><Link to="/practice/figure-sequences" className="hover:text-primary transition-colors">Figure Sequences</Link></li>
              <li><Link to="/practice/mathematical-equations" className="hover:text-primary transition-colors">Mathematical Equations</Link></li>
              <li><Link to="/practice/latin-squares" className="hover:text-primary transition-colors">Latin Squares</Link></li>
              <li><Link to="/practice/subject-module" className="hover:text-primary transition-colors">Subject Module</Link></li>
              <li><Link to="/mock/complete" className="hover:text-primary transition-colors font-medium text-primary">Complete Mock</Link></li>
            </ul>
          </div>

          <div>
            <h4 className="font-semibold mb-4">Platform</h4>
            <ul className="space-y-2 text-sm text-muted-foreground">
              <li><Link to="/" className="hover:text-primary transition-colors">Home</Link></li>
              <li><Link to="/about" className="hover:text-primary transition-colors">About Us</Link></li>
              <li><Link to="/feedback" className="hover:text-primary transition-colors">Feedback & Contact</Link></li>
            </ul>
          </div>

          <div>
            <h4 className="font-semibold mb-4">Legal</h4>
            <ul className="space-y-2 text-sm text-muted-foreground">
              <li><Link to="/privacy-policy" className="hover:text-primary transition-colors">Privacy Policy</Link></li>
              <li><Link to="/terms-and-conditions" className="hover:text-primary transition-colors">Terms & Conditions</Link></li>
              <li><Link to="/cookie-policy" className="hover:text-primary transition-colors">Cookie Policy</Link></li>
              <li><Link to="/disclaimer" className="hover:text-primary transition-colors">Disclaimer</Link></li>
            </ul>
          </div>
        </div>

        <div className="mt-12 pt-8 border-t flex flex-col md:flex-row items-center justify-between gap-4 text-xs text-muted-foreground">
          <p>© {new Date().getFullYear()} dMAT Practice Pro. All rights reserved.</p>
          <p className="text-center md:text-right">
            An independent preparation platform. Not affiliated with APS India, g.a.s.t., or the TestDaF Institute.
          </p>
        </div>
      </div>
    </footer>
  );
}
