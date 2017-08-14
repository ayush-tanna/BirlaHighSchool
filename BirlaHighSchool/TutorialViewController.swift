

import UIKit

class TutorialViewController: UIViewController {

    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    var tutorialPageViewController: TutorialPageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: #selector(TutorialViewController.didChangePageControlValue), for: .valueChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            self.tutorialPageViewController = tutorialPageViewController
        }
    }

    @IBAction func didTapNextButton(_ sender: UIButton) {
        tutorialPageViewController?.scrollToNextViewController()
    }
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
    func didChangePageControlValue() {
        tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
}

extension TutorialViewController: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController,
        didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(_ tutorialPageViewController: TutorialPageViewController,
        didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
